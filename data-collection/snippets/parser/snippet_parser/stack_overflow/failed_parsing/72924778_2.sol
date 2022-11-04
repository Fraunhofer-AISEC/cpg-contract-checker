> sourceCode = fs.readFileSync('Greetings.sol').toString()
'pragma solidity ^0.8.15;\r\n' +
  '\r\n' +
  'contract Greetings {\r\n' +
  '    string message;\r\n' +
  '\r\n' +
  '    constructor(){\r\n' +
  `        message = "I'm ready";\r\n` +
  '    }\r\n' +
  '\r\n' +
  '    function setGreetings(string memory _message) public {\r\n' +
  '        message = _message;\r\n' +
  '    }\r\n' +
  '\r\n' +
  '    function getGreetings() public view returns (string memory){\r\n' +
  '        return message;\r\n' +
  '    }\r\n' +
  '}'
> compiledCode = solc.compile(sourceCode)
'{"errors":[{"component":"general","formattedMessage":"* Line 1, Column 1\\n  Syntax error: value, object or array expected.\\n* Line 1, Column 2\\n  Extra non-whitespace after JSON value.\\n","message":"* Line 1, Column 1\\n  Syntax error: value, object or array expected.\\n* Line 1, Column 2\\n  Extra non-whitespace after JSON value.\\n","severity":"error","type":"JSONError"}]}'
