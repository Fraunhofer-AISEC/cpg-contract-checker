
pragma solidity ^0.8.0;

contract Students {

    struct Student {
        string answers;
    }

    mapping(uint256 => Student) public students;
    mapping(uint256 => uint256) public mappingIdToStudentId;
    uint256 public numberOfStudents;

    function getStudentMarks(uint256 _id) public view returns (string memory Answers, 
    address sender )
    {
        return ( students[_id].answers, msg.sender);
    }

    function getStudentsMarks() public view returns (uint256[] memory ids, string[] memory answers, address _sender) {
        uint256[] memory ids = new uint256[](numberOfStudents);
        string[] memory answers = new string[](numberOfStudents);
        for (uint256 i; i < numberOfStudents; i++) {
            ids[i] = mappingIdToStudentId[i];
            answers[i] = students[mappingIdToStudentId[i]].answers;
        }

        return (ids, answers, msg.sender);
    }

    function addMarks(uint256 _id, string memory _ans) public {
        require(bytes(_ans).length > 0, "Cannot save empty answer");

        Student memory student = students[_id]; 
        if(bytes(student.answers).length == 0) {
            mappingIdToStudentId[numberOfStudents] = _id;
            numberOfStudents = numberOfStudents + 1;
        } 

        student.answers = _ans;
        students[_id] = student;
    }     
}
