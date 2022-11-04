 
pragma solidity 0.8.7;

contract minter{

  mapping(address => bool) whiteList;

  function whiteLister( address _user) public{
    
    whiteList[_user] = true;
  }

  function checkWhhiteListed(address user) public view returns (bool){
    
    return whiteList[user];
  }

}
