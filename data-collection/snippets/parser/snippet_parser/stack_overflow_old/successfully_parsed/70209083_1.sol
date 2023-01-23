contract UserMessage {
  string message;
  constructor(string memory message){
     message = _message;
  }
}

contract DeployUserMessage {
  mapping(address => address) userToContract;
  
  function Deploy(string memory message) public {
    address contractAddress = new UserMessage(message);
    userToContract[msg.sender] = contractAddress;
  }
}
