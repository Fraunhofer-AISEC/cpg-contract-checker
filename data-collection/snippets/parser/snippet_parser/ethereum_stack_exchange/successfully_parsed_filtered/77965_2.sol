pragma solidity 0.5.11;

contract Simple {

  address public owner; 

  function setter(address newOwner) public payable returns(bool, uint) {
    require(msg.value >= 1 ether, "Send more money"); 
    owner = newOwner; 
    msg.sender.transfer(1 ether); 
    return(true, 1); 
  }
}
