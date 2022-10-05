

pragma solidity >=0.8.0 <0.9.0;

contract MyContract {
    struct Student {
        string Answers;
    }
    mapping(uint256 => Student) public students;
    Student[] public student;

    function getStudentMarks(uint256 _id) public view returns (string memory Answers, 
    address sender )
    {
        Student storage s = students[_id];
        return ( s.Answers, msg.sender);
    }

    function addMarks(uint256 Id, string memory Ans) public {
        Student = students[Id];
        Student.Answers = Ans;
        student.push(Id) -1;        
    }     
}
