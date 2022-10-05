pragma solidity ^0.4.19;
contract Test {
   
   uint[3] storage_array;

   function getArray() public view returns(uint[3]){
       return storage_array;
   }

   
   function setArray() public {
       uint[3] memory tmp = [uint(1),2,3];
       storage_array =tmp;
   }

   
   function fillTemp() public returns (uint[3]) {
       uint[3] memory tmp = [uint(1),2,3];
       return tmp;
   }

}
