modifier onlyIfOkayAndAuthorized {
  require(isOkay()); 
  require(isAuthorized(msg.sender));
  _;
}



function isOkay() public view returns(bool isIndeed) {
  
  return true;
}

function isAuthorized(address user) public view returns(bool isIndeed) {
  
  return true;
}
