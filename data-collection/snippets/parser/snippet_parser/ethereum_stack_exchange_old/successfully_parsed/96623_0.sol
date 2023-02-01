pragma solidity >=0.7.0 <0.9.0;

struct SomeStruct {
   string name;   
   uint number;
}

mapping(address => SomeStruct[]) database

function getAll() public view returns (SomeStruct[] memory) {
     SomeStruct[] memory structArray = database[msg.sender];
     require(structArray.length > 0, "is empty");
        
     return structArray;
}
