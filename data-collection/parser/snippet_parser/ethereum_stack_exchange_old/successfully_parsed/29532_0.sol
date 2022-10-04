contract Messenger {

  mapping (address => string) message;

  function sendMessage(address _recipient, string _message){
    message[_recipient] = _message;
  }

  function readMessage() returns (string) {
    return message[msg.sender];
  }

}
