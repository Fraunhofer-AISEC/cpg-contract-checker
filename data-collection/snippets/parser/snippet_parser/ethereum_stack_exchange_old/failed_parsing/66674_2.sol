modifier onlyOwner {
  require(msg.sender == owner);
  _; 
}

function myFunction() public onlyOwner returns(bool success) { ...
