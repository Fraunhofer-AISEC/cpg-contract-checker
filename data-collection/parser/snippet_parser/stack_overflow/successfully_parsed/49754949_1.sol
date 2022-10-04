pragma solidity ^0.4.21;
import './Patient.sol';

contract Doctor{
    
    address public owner;
    string public name;
    string public dateOfBirth;
    string public patient_problem;

    modifier isOwnerPatient {
        require(msg.sender == owner);
        _;
    }
    
    
    function Doctor() {
        owner =  msg.sender;
    }
    
    function AddProblem(string _allergie) public isOwnerPatient {
        patient_problem =  _allergie;
    }
}
