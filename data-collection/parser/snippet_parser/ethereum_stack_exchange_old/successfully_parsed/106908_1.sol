pragma solidity ^0.8.0;

contract StudentContract  {


uint256 internal studentCount = 0;


struct StudentInfo {
string name;  



}

StudentInfo[] internal StudentInfoArray;
string[] internal OtherArray;
address payable public Owner;
mapping (address => uint256) internal students;

event SetData(string message); 


constructor () {
    
    Owner = payable(msg.sender);        

}


function setData(string memory _name) public returns (uint256) {
    
    require(students[msg.sender] == 0, "Data already exist for this wallet");
    
    StudentInfo memory tx1 = StudentInfo(_name);
    StudentInfoArray.push(tx1);
    studentCount ++;
    students[msg.sender] = studentCount;
    
    emit SetData("Congratulations you have set your data");
    
    return studentCount;
}
    
function setNewName(string memory _name)public returns(bool success){
    uint studentId = students[msg.sender];
    StudentInfo storage newStudent = StudentInfoArray[studentId - 1];
    newStudent.name = _name;
    return true;
    
}

function getStudent(uint studentID) public view returns(StudentInfo memory) {
    return StudentInfoArray[studentID-1];
}
}