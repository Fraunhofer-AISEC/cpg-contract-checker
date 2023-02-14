pragma solidity ^0.5.0;

contract Buy {
    address[] public buyers;
    uint256 public minAmount;

    struct Buyer {
    uint256 amountPayed;
    uint256 itemSelected;
    }
    mapping(address => Buyer) public buyerInfo;

    function buy(uint256 itemSelected) public payable returns (uint amount){
    require(itemSelected >= 1 && itemSelected <= 10);
    require(msg.value >= minAmount);

    buyerInfo[msg.sender].amountPayed = msg.value;
    buyerInfo[msg.sender].itemSelected = itemSelected;

    buyers.push(msg.sender);

        return amount;
  }
}
