pragma solidity ^0.4.11;

contract Purchase {
  uint public amount;
  address public seller;
  address public buyer;

  event LogPurchase(address buyer, uint amount);

  function Purchase(uint _amount) {
    seller = msg.sender;
    amount = _amount;
  }

  function confirmPurchase() 
    payable 
    returns(bool success)
  { 
    if(msg.value != amount) throw; 
    LogPurchase(msg.sender,msg.value);
    seller.transfer(msg.value); 
    return true;
  }
}
