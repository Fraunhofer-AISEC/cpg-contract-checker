pragma solidity ^0.4.6;
import './Doctor.sol';

contract Patient {
    bytes private name = "";
    bytes private dateOfBirth="NA";
    bytes private problemFaced = "";
    address public myDoctor;

    
    event patientChanged(string whatChanged);

    function createDoctor() public {
        myDoctor = new Doctor(getName(), getDateOfBirth(), getGender(), problemFaced);
    }

    function ProblemFaced(string problems) public {
        problemFaced = bytes(problems);
    }

    function getName() internal view returns (bytes) {
        return name;  
    }
    function getDateOfBirth() internal view returns (bytes) {
        return dateOfBirth; 
    }

    function setName(string _name) public {
        name = bytes(_name);  
        emit patientChanged("name changed"); 
    }
    function setDateOfBirth(string _dateOfBirth) public {
        dateOfBirth = bytes(_dateOfBirth);   
        emit patientChanged("dateOfBirth changed"); 
    }
}
