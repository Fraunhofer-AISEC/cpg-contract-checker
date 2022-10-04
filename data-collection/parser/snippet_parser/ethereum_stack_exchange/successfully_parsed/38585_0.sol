pragma solidity ^0.4.4;

contract Register{

 struct Details{
    bytes id;
    string name;
    string age;
   string country;
 }
 mapping (bytes => Details) DetailsTable;

bytes[] uid;

 function saveBondToBC(bytes id,string name,string age,string country) payable returns(bool success){

DetailsTable[id].id = id;
DetailsTable[id].name = name;
DetailsTable[id].age = age;
DetailsTable[id].country = country;
return true;

}


function insertID(bytes id) payable returns(bool success){

uid.push(id);
return true;

}

function getAllID() public returns(bytes[]){

    return uid;

}

}
