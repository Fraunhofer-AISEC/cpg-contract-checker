pragma solidity ^0.4.0;

contract RegisterContract{

struct RegStruct{
    uint regno;
    string name;
    string dob;
    uint contact;
}

RegStruct[] private regStruct;
uint Index; 

function set(uint _regno,string _name,string _dob, uint _contact) public 
returns(uint Index){
    Index=regStruct.length;
    regStruct.push(regStruct(_regno,_name,_dob,_contact));
}

function getCount() public constant returns(uint count) {   
    return regStruct.length;
}
function get(uint Index) public constant returns(string name,uint regno,string dob){
    return(
        regStruct[Index].name,
        regStruct[Index].regno,
        regStruct[Index].dob
    );
}
}
