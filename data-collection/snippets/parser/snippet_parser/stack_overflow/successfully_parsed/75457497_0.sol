\`


pragma solidity ^0.8.0;

contract ReferenceTypes {

    address public owner;
    
    struct student {
        string Name;
        uint Age;
        string BirthPlace;
        uint8 Marks;
        
    
    }
    
    constructor() {
        owner = msg.sender;
    }
    
    mapping (address => student) public Info;
    
    address[] public student_Info;
    
    function addInfo(student memory _student, address _address) public {
    
        require(owner == msg.sender, "Only admin can add Info!!!");
    
        Info[_address] = _student;
    
        student_Info.push(_address);
    
    } 
    
    function count() public view returns(uint) {
        return student_Info.length;
    }
    }

\`
