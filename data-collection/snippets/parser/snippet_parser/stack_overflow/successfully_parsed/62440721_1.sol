pragma solidity ^0.4.0;

contract postRecord {

bytes32 public patientRecords;

address public doctor;

function Person() private{

    doctor = msg.sender;

}

struct patient {

    address client;

    bool consent;

    bytes32 name;

}

function setPatientRecords(bytes32 _patientRecords) public {

    patientRecords = _patientRecords;

}

event Post(bytes32 patientRecords, address doctor);

modifier rightPerson {

    require (msg.sender = doctor);

    _;

}

function getRecords()public payable{

    Post(patientRecords, doctor);

}}   
