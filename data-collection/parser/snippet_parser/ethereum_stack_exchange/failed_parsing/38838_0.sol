pragma solidity ^0.4.4;

 contract Register{

 struct Details{
  bytes id;
  string name;

  }
 mapping (bytes => Details) DetailsTable;

 function saveBondToBC(bytes id,string name) 
 payable returns(bool success){

DetailsTable[id].id = id;
DetailsTable[id].name = name;
return true;
}

function getAllNames(bytes id) return (string){
DetailsTable[id].name; 
 }     
