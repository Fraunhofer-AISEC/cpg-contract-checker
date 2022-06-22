pragma solidity ^0.4.24;

contract Item is ERC721{

  struct Item{
      string name; 
      uint level; 
      uint rarityLevel;  
  }

  Item[] public items; 
  address public owner;

  function Item() public {
      owner = msg.sender; 
  }

  function createItem(string _name, address _to) public{
      require(owner == msg.sender); 
      uint id = items.length; 
      items.push(Item(_name,5,1)) 
      _mint(_to,id); 
  }

}
