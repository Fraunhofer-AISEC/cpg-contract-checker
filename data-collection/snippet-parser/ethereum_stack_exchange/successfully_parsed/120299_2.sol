

pragma solidity >=0.8.0 <0.9.0;

contract MyContract {

    struct Student {
        string answers;
    }

    mapping(uint256 => Student) public students;

    function getStudentMarks(uint256 _id) public view returns (string memory Answers, 
    address sender )
    {
        return ( students[_id].answers, msg.sender);
    }

    function addMarks(uint256 _id, string memory _ans) public {
        Student memory student = students[_id];  
        student.answers = _ans;
        students[_id] = student;
    }      
}
