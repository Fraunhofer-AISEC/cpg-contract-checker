pragma solidity 0.4.24;


import "../abstracts/organAbstract.sol";

contract organContract is organA {


address contractOwner;
uint256 organCount;


constructor() public {
    contractOwner = msg.sender; 
    emit stateOwner(msg.sender); 
    organCount = 0; 
}


mapping (bytes32 => organ) private organsList;
mapping (uint256 => bytes32) private organIndex;


bytes32[] private organsListByHash;




modifier contractOwnerOnly () {
    
    require(msg.sender == contractOwner, "You are not allowed to interact!");
    _;
}


modifier checkOrganExistence(bytes32 _organHash) {
    require(bytes(organsList[_organHash].organState).length != 0, "Organ with given id doesn't exist!");
    _;
}


modifier organCountMin() {
    require(organCount != 0, "No organs found to return!");
    _;
}




event stateOwner (
    address ownerAddress
);


event newOrganAdded (
    address organOwner,
    bytes32 organId
);


event organStateChanged (
    bytes32 organId,
    string state
);






function addOrgan(address _originOwner, string _type, string _state) external returns(bytes32 organHash) {

    
    bytes32 uniqueOrgan = keccak256(_type, _originOwner);

    
    organsList[uniqueOrgan].originOwner = _originOwner; 
    organsList[uniqueOrgan].currentOwner = _originOwner; 
    organsList[uniqueOrgan].organType = _type; 
    organsList[uniqueOrgan].organState = _state; 

    
    organIndex[organCount] = uniqueOrgan; 
    organCount++; 

    organsListByHash.push(uniqueOrgan); 
    emit newOrganAdded(_originOwner, uniqueOrgan); 

    
    return uniqueOrgan;
}


function changeOrganState(bytes32 _organId, string _state) checkOrganExistence(_organId) public {
    
    

    organsList[_organId].organState = _state; 
    emit organStateChanged(_organId, _state);
    return;
}



function getOrganListLength() organCountMin() public view returns(uint ListLenght) {
    return organCount;
}


function getOrganList(uint indexNumber) organCountMin() public view returns(bytes32 OrganId) {
    return organIndex[indexNumber]; 
}



function getOrgan(bytes32 _organHash) checkOrganExistence(_organHash) public view returns(address OriginOwner, address CurrentOwner, string OrganType, string OrganState) {
    
    return (
        organsList[_organHash].originOwner,
        organsList[_organHash].currentOwner,
        organsList[_organHash].organType,
        organsList[_organHash].organState
    );
}


function existsOrgan(bytes32 _organHash) external view returns(bool Existence) {
    if (bytes(organsList[_organHash].organState).length != 0) { return true; } else { return false; }
}


function organOriginOwner(bytes32 _organHash) organCountMin() checkOrganExistence(_organHash) external view returns(address OriginOwner) {
    return organsList[_organHash].originOwner;
}
}
