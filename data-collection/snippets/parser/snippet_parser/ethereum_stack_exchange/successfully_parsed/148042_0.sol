
pragma solidity ^0.8.0;


contract School {
    address[] public students; 

    
    event NewStudentAdded(string name, address studentAddress);

    
    function addStudent(string memory name) public {
        
        address newStudent = address(new Student(name));
        students.push(newStudent);
        
        
        emit NewStudentAdded(name, newStudent);
    }

    
    function updateStudentName(uint studentIndex, string memory newName) public {
        
        Student student = Student(students[studentIndex]);
        
        
        student.updateName(newName);
    }
}


contract Student {
    string public name; 

    
    event NameUpdated(string oldName, string newName);

    
    constructor(string memory _name) {
        name = _name;
    }
    
    
    function updateName(string memory newName) public {
        
        emit NameUpdated(name, newName);
        
        
        name = newName;
    }
}

