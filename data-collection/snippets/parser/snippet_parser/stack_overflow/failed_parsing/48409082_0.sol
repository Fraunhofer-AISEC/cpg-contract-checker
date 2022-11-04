pragma solidity ^0.4.17;

contract ModifiersTutorial {

address public owner;
uint256 public price = 0;
address public sender=msg.sender;


modifier onlyOwner(sender){
if (owner==sender);
}



function changePrice(uint256 _price) public onlyOwner {
    price = _price;
}

function ModifiersTutorial () {
    owner = msg.sender; 
}
