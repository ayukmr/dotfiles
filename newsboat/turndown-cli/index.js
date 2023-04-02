// ====================
// === Turndown CLI ===
// ====================

const TurndownService = require('turndown');
const { gfm } = require('turndown-plugin-gfm');

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

// use github flavored markdown
service.use(gfm);

// convert images to ascii art
service.addRule('asciiImages', {
  filter: (node) => (
    node.nodeName === 'IMG' &&
    node.getAttribute('src')?.match(/^https?:/)
  ),

  replacement: (content, node) => {
    // node attributes
    const nodeAlt = node.getAttribute('alt');
    const nodeSrc = node.getAttribute('src');

    if (nodeAlt.match(/^\ufffd*\p{Emoji}+$/u)) {
      // return alt if emoji
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

// convert image links into plain images
service.addRule('imageLinks', {
  filter: (node) => (
    node.nodeName === 'A' &&
    node.firstChild?.nodeName === 'IMG'
  ),
  replacement: (content) => `${content}\n\n`
});

// convert stdin into markdown
process.stdin.on('data', (data) => {
  const markdown = service.turndown(data.toString());

  // return markdown
  console.log(markdown);
});
