pragma solidity ^0.8.7;
   contract mappingStruct {

   mapping (uint=>string[]) mappingAndArray;

   function addToMapping(uint myKey,string[] memory name)public{
       mappingAndArray[myKey] = name;
   }
}
