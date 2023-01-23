pragma solidity ^0.4.18;

contract escrow {

  address seller;
  address buyer;
  address owner = msg.sender;

  function setup(address seller, address buyer){
    if(msg.sender == owner){
        this.seller = seller;
        this.buyer = buyer;
    }
  }

}
