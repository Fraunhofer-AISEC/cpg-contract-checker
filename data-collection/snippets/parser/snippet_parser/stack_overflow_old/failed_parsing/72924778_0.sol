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
