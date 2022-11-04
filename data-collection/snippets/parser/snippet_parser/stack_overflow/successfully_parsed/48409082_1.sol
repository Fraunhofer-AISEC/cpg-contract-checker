pragma solidity ^0.4.17;

contract ModifiersTutorial {

    address public owner;
    uint256 public price = 0;

    modifier onlyOwner(){
    if( owner == msg.sender ) _;
    }

    function changePrice(uint256 _price) public onlyOwner{
        price = _price;
    }

    function ModifiersTutorial () {
        owner = msg.sender; 
    }
}
