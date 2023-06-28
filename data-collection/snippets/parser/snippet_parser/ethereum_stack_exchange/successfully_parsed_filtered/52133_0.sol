pragma solidity ^0.4.24;

contract FirstContract {
address owner;

function FirstContract() public {    
     owner = msg.sender;
}

modifier ownerOnly()  {     
      require(msg.sender == owner);
      _;
}

function checkOwner(address ownerAddress) public view ownerOnly returns(string) {
      return("you are owner");
}
}
