
pragma solidity ^0.5.16;
contract OwnableWallet {
address payable owner;

function initWallet(address payable _owner) public {
   owner = _owner; 
   
}            

function withdraw(uint _amount) public {
   if (msg.sender == owner) {
      owner.transfer(_amount);
  }
}
function() external payable{}
}
