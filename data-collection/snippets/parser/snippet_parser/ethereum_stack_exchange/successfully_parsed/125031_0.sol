pragma solidity 0.5.1;

contract Management{

struct studentInfo {
    string name;
    string birthdate;
    string department;
    string location;
    string email;
    uint256 mobile_no;
}

mapping(uint256 => studentInfo) students;
uint256[] public studentIds;

function registerStudent(string memory name, string memory birthdate, string memory department, 
                         string memory location, string memory email, uint256 id, uint256 mobile_no) public {
    studentInfo storage newStudent = students[id];
    newStudent.name = name;
    newStudent.birthdate = birthdate;
    newStudent.department = department;
    newStudent.location = location;
    newStudent.email = email;
    newStudent.mobile_no = mobile_no;
    studentIds.push(id);
}

function getStudent(uint256 id) public view returns (string memory, string memory, string memory, 
                                                string memory, string memory, uint256){
    studentInfo storage s = students[id];
    return (s.name,s.birthdate,s.department,s.location,s.email,s.mobile_no);
}
}
