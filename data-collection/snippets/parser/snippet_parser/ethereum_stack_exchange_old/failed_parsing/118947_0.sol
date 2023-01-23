  address payable owner;
  constructor ()  
  {
    owner= payable(msg.sender);
  }
  function kill() public
  {
    if(msg.sender== owner)
    {selfdestruct(owner);}

  }
}

contract greeter is mortal{
  string greeting;
  constructor (string memory _greeting) {
    greeting = _greeting;
  }
  function setGreeting (string memory _greeting) public {
    greeting = _greeting;
    
  }
  function greet() public view returns (string memory)
  {
    return greeting;    
  }
}
