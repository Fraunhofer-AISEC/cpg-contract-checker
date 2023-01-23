pragma solidity ^0.4.22;

contract Example{

struct Institution {
    bytes32 name;
    bool exists;
}

event AddedInstitution(bytes32 name);

mapping(bytes32 => Institution) institutions;


function addInstitution(
    bytes32 name,
    bytes32 upi
) public {
    require(!isInstitutionExists(upi));
    institutions[upi].name = name;
    institutions[upi].exists = true;
    emit AddedInstitution(name);

}

function getInstitution(bytes32 upi) public constant returns (bytes32 name){
    require(isInstitutionExists(upi));
    return (
    institutions[upi].name
    );

}

function isInstitutionExists(bytes32 upi) private constant returns (bool){
    if (institutions[upi].exists) {
        return true;
    }
    return false;
}
}