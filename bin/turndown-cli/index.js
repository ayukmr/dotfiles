var TurndownService = require('turndown');

// override escaping
TurndownService.prototype.escape = (str) => str

function toMarkdown(data) {
  // turndown settings
  let settings = {
    hr: '***',
    headingStyle:   'atx',
    codeBlockStyle: 'fenced'
  }

  let service = new TurndownService(settings);
  let markdown = service.turndown(data.toString());

  console.log(markdown);
}

// convert stdin into markdown
process.stdin.on('data', toMarkdown);
