pragma solidity ^0.4.17;


contract MedicalRecord {
struct Doctor {
    bytes32 name;
    uint id;
}

struct Note {
    bytes32 title;
    bytes32 note;
}

address public patient;
uint private doctorId;
bytes32[] public doctorsNames;
Note[] notes;
mapping (address => Doctor) private doctors;

modifier onlypatient {
    require(msg.sender == patient);
    _;
}

modifier isCurrentDoctor {
    require(!(doctors[msg.sender].id < doctorId));
    _;
}

function MedicalRecord() public {
    patient = msg.sender;
    doctorId = 0;
}

function giveDoctorAccess(address drAddress, bytes32 name)
public
onlypatient
returns (bytes32)
{
    doctors[drAddress] = Doctor (name, doctorId);
    doctorId++;
    doctorsNames.push(name);
    return (name);
}

function getNotes()
    view
    public
    isCurrentDoctor
    returns (bytes32[], bytes32[])
{
    bytes32[] memory titles = new bytes32[](notes.length);
    bytes32[] memory noteTexts = new bytes32[](notes.length);

    for (uint i = 0; i < notes.length; i++) {
        Note storage snote = notes[i];
        titles[i] = snote.title;
        noteTexts[i] = snote.note;
    }

    return (titles, noteTexts);
}

function getDoctorsNames() view public returns (bytes32[]) {
    return doctorsNames;
}

function addNote(bytes32 title, bytes32 note) public isCurrentDoctor 
{
    notes.push(Note({title: title, note:note}));
}
}
