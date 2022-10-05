pragma solidity ^0.4.4;

contract Pass{
mapping(address => bool) ownership;
mapping(address => string) notes;

constructor(address genesis) public {
    ownership[genesis] = true; 
}

function checkOwnership(address p) public view returns(bool){
    if(ownership[p]){
        return true;
    }
    return false;
}

function sign(string signedNote) public returns(uint){ 
    if(checkOwnership(msg.sender)){ 
        notes[msg.sender] = signedNote;
        return 1;
    }
    return 0;
}

function pass(address recipient) public returns(uint){ 
    if(checkOwnership(msg.sender)){ 
        ownership[msg.sender] = 0;
        ownership[recipient] = 1;
        return 1;
    }
    return 0;
}

function viewNotes(address participant) public returns(string){ 
    if(notes[participant] !== 0){
        return (notes(participant));   
    }
}
