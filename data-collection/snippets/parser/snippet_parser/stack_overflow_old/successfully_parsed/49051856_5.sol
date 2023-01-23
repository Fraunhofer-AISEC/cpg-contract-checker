pragma solidity ^0.4.17;

contract TestArray {
   uint[] public items;

   constructor () public {
      items.push(1);
      items.push(2);
      items.push(3);
      items.push(4);
   }

   function pushElement(uint value) public {
      items.push(value);
   }

   function popElement() public returns (uint []){
      delete items[items.length-1];
      items.length--;
      return items;
   }

   function getArrayLength() public view returns (uint) {
      return items.length;
   }

   function getFirstElement() public view returns (uint) {
      return items[0];
   }

   function getAllElement()  public view returns (uint[]) {
      return items;
   }
}
