// ====================
// === Turndown CLI ===
// ====================

const TurndownService = require('turndown');

// override escaping
TurndownService.prototype.escape = (str) => str

function toMarkdown(data) {
  // turndown settings
  const settings = {
    hr: '***',
    headingStyle:   'atx',
    codeBlockStyle: 'fenced'
  }

  const service  = new TurndownService(settings);
  const markdown = service.turndown(data.toString());

  // return markdown
  console.log(markdown);
}

// convert stdin into markdown
process.stdin.on('data', toMarkdown);
