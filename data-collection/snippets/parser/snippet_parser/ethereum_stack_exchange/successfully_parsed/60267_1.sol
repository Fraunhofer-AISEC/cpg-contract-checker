pragma solidity 0.4.25;

contract Loop {

    struct StudentStruct {
        uint grade;
    }
  
    mapping(address => StudentStruct) public studentStructs;
    address [] public studentList;

    event LogStudentGrade(address student, uint studentGrade);

    function appendStudentGrade(address student, uint studentGrade) public {
        studentList.push(student);
        studentStructs[student].grade = studentGrade;
    }
    
    function getStudentCount() public view returns(uint count) {
        return studentList.length;
    }
    
    function studentLoop() public {
        
        
        
        for (uint i=0; i<studentList.length; i++) {
            emit LogStudentGrade(studentList[i], studentStructs[studentList[i]].grade);
        }
    }
}
