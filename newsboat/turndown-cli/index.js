// ====================
// === Turndown CLI ===
// ====================

const TurndownService = require('turndown');
const shell = require('shelljs');

// override escaping
TurndownService.prototype.escape = (str) => str;

// turndown settings
const settings = {
  hr: '***',
  headingStyle:   'atx',
  codeBlockStyle: 'fenced'
};

// create service
const service = new TurndownService(settings);

// add rule for images with links
service.addRule('asciiImages', {
  filter: (node) => (
    node.nodeName === 'IMG' &&
    node.getAttribute('src')?.match(/^https?:/)
  ),

  replacement: (content, node) => {
    // node attributes
    const nodeAlt = node.getAttribute('alt');
    const nodeSrc = node.getAttribute('src');

    if (nodeAlt.length === 1) {
      return nodeAlt;
    } else {
      // create ascii art
      const { code, stdout } = shell.exec(
        `curl -fsSL --retry 0 '${nodeSrc}' | magick - -auto-orient jpg:- | jp2a --colors --border --width=80 -`,
        { silent: true }
      );

      const markdownImage = `![${nodeAlt}](${nodeSrc})`;

      // return image
      return code === 0
        ? `\n${'```'}\n${stdout}${'```'}\n${markdownImage}\n${content}`
        : `\n${markdownImage}\n${content}`;
    }
  }
});

// convert stdin into markdown
process.stdin.on('data', (data) => {
  const markdown = service.turndown(data.toString());

  // return markdown
  console.log(markdown);
});
