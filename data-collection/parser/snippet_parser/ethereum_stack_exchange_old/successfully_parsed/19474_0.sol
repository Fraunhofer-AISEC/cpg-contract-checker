pragma solidity ^0.4.4;

contract Escrow {

address public buyer;
address public seller;
address public arbiter;

  function Escrow(address _seller, address _arbiter) {
    buyer = msg.sender;
    seller = _seller;
    arbiter = _arbiter;
}

  function payoutToSeller() {
    if(msg.sender == buyer || msg.sender == arbiter) {
      seller.send(this.balance);
    }
}

  function refundToBuyer() {
    if(msg.sender == seller || msg.sender == arbiter) {
      buyer.send(this.balance);
    }
  }

  function getBalance() constant returns (uint) {
    return this.balance;
  }
}
