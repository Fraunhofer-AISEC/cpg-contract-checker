contract Ownable {

  address public owner;

  modifier onlyOwner {
    require(msg.sender == owner, "Ownable: You are not the owner, Bye.");
    _;
  }

  constructor () public {
    owner = msg.sender;
  }
}

contract Owned is Ownable {

  function doSomething() public onlyOwner {
    
    
  }
}
