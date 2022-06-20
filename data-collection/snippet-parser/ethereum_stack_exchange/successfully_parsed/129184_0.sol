
pragma solidity 0.5.2;

contract Record5keccak {

    struct Attribute {
        bytes32 comment;
        uint expiredTime;
    }

    mapping(bytes32=>Attribute) records;

    constructor() public{

    }

    function record(bytes32 name, bytes32 email, bytes32 addr, bytes32 phone, bytes32 title, bytes32 comment, uint expiredTime) public {
        bytes32 encryptedBytes = keccak256(abi.encodePacked(name, email, title, addr, phone));
        records[encryptedBytes].comment = comment;
        records[encryptedBytes].expiredTime = expiredTime;
    }
}
