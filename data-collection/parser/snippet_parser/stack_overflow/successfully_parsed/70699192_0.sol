    pragma solidity ^0.8.6;
contract mycontract{

address owner;
string name;
bool visible;
uint16 count;

constructor ()public {
    owner=msg.sender;
    
}

function changname (stringmemory _name) public returns (stringmemory){
    if(msg.sender==owner){
        name=_name;
        return "sucsesss";
        }else{
            return "acsess denid";
    }
}

function showname () view public returns(stringmemory){
    return name;
    
}
}
