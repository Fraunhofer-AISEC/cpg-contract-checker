
pragma solidity >=0.7.0 <0.9.0;

contract sol {
    struct student {
        string name;
        uint256 ID;
        string grade;
    }
    bytes32[] private student_Address;
    mapping(bytes32=>student) private studentMap;

    uint256 private index = 0;
    function createNewStudent(string memory _name, uint256 _id, string memory _grade) public {
        student_Address.push(keccak256(abi.encodePacked(index)));
        studentMap[student_Address[index]] = student(_name, _id, _grade);
        index++;
    }

    function getStudentInfo(uint256 num) public view returns (bytes32, student memory) {
        return (student_Address[num], studentMap[num]); 
    }
}
