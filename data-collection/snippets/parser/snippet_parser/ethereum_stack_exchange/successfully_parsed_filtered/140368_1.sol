contract Inbox {
  string public message;

  constructor(string initialMessage) public {
    message = initialMessage;
  }

  function setMessage(string newMsg) public {
    message = newMsg;
  }

  function getMessage() public view returns(string){
    return message;
  }
}
