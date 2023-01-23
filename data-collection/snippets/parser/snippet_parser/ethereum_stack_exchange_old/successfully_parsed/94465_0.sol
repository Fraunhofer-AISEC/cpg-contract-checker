pragma solidity ^0.7.0;
import "./Item.sol";

contract Auction {

    uint256 lastId = 0;
    mapping (uint256 => Item) idToItem;

    address admin;

constructor () {
    admin = msg.sender;
}

function newItem(string memory _name, uint256 _price, uint256 _time) public {
    lastId += 1;
    idToItem[lastId] = new Item(_name, _price, msg.sender, _time);
}

function newBid(uint256 itemId) public payable {
    Item item = idToItem[itemId];
    
    item.newBid(msg.sender, msg.value);
}

function timeLeft(uint256 itemId) public view returns(uint256){
    return idToItem[itemId].timeLeft();
}

function getMaxBid(uint256 itemId) public view returns(uint256) {
    return idToItem[itemId].getMaxBid();
}
}