pragma solidity ^0.4.6;
contract Mapping {
struct Entity{
    bool isActive;
    uint index;
}
mapping(address => Entity) values;
address[] valuesTrue;
function getValue(address a) public view returns (bool) {
    return values[a].isActive;
} 

function getAllValues() public view returns(address[]) { 
    return valuesTrue;
}

function addValue(address a, bool b) public {
    values[a].isActive = b;
    if (b)
        values[a].index     = valuesTrue.push(a)-1;


    else {

        if (values[a].isActive) {
            uint rowToDelete = values[a].index;
            address keyToMove = valuesTrue[valuesTrue.length-1];
            valuesTrue[rowToDelete] = keyToMove;
            values[keyToMove].index = rowToDelete; 
            valuesTrue.length--;
        }

    }
}
}
