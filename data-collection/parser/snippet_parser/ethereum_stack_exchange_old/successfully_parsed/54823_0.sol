pragma solidity ^0.4.22;

contract University {
    address public owner;
    address public student;
    address firstName;
    address lastName;
    bytes32 Studies;
    uint age;
    uint DateOfBirth;
    bytes32 public caCertificate;
    bytes32 ipfs_hash;
    constructor() public {
        owner = msg.sender;
    }
    modifier onlyOwner()  {
        if (msg.sender == owner) _;
    }
    modifier onlyOwnerOrStudent() {
        if (msg.sender == owner || msg.sender == student) _;
    }
    function setstudent () public;

    function getStudent () public;

    event student(
        bytes32 firstNameName,
        bytes32 lastName,
        bytes32 Studies,
        uint age,
        uint DateOfBirth,
        bytes32 ipfs_hash
        );

    function checkStudentExists() public constant returns (bool) {
        if (student == firstName && student == lastName) return true;
    }

    function setIPFSHash(bytes32 _ipfs_hash) public onlyOwnerOrStudent {
        ipfs_hash = _ipfs_hash;
    }
}
