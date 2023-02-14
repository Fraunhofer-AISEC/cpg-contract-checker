pragma solidity ^0.5.16;
import './Users.sol';

contract SupplyChain is Users{

mapping (uint => Item) items;

 struct Item {
    uint    sku;  
    uint    upc; 
    address ownerID;
}
function pfunc(uint _upc, address _owner) public onlyManufacturer(msg.sender) view returns(address){
    return _owner;
  }
}