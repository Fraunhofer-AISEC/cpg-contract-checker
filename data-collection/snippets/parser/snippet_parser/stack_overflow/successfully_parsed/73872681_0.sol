    

pragma solidity 0.8.0;

contract Escrow {

  address payable public buyer;
  address payable public merchant;
  address public arbiter;
  uint public itemId;
  uint public amount;

  mapping(address => bool) public releaseAmount;
  mapping(address => bool) public refundAmount;

  uint public releaseVote;
  uint public refundVote;

  bool public fundsSuccess;
  address public holder;

constructor(uint _itemId, address payable _buyer, address payable _merchant, address _arbiter) payable {

      buyer = _buyer;
      merchant = _merchant;
      arbiter = _arbiter;
      fundsSuccess = false;
      amount = msg.value;
      holder = msg.sender;
      itemId = _itemId;
    }

function escrowDetails() view public returns(address, address, address, bool, uint, uint){
  return (buyer, merchant, arbiter, fundsSuccess, releaseVote, refundVote);
}

function releaseAmountToMerchant(address perso) public{
  require(fundsSuccess == false);
  require(msg.sender == holder);
    if ((perso == buyer || perso == merchant || perso == arbiter)  && releaseAmount[perso] != true){
      releaseAmount[perso] = true;
      releaseVote +=1;
    }
    if(releaseVote == 2){
      merchant.transfer(amount);
      fundsSuccess = true;
    }
}

  function refundAmountToBuyer(address perso) public{
    require(fundsSuccess == false);
    require(msg.sender == holder);
    if ((perso == buyer || perso == merchant || perso == arbiter)  && refundAmount[perso] != true){
      refundAmount[perso] = true;
      refundVote +=1;
  }
    if(refundVote == 2){
      buyer.transfer(amount);
      fundsSuccess = true;
    }

  }
}
