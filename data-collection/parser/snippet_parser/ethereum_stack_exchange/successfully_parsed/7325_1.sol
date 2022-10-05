pragma solidity ^0.4.25;

contract Test {

    struct  User{
        uint256 uuid;
        bytes32 first_name;
        bytes32 last_name;
        bytes32 sex;
        bytes32 age;
        bytes32 birth_day;
        bytes32 addr;
        bytes32 mail_address;
        bytes32 phone_number;
    }

    mapping(uint256 => User) users;

    function getUser(uint256 uuid) public constant returns (bytes32, bytes32, bytes32, bytes32, bytes32, bytes32, bytes32, bytes32) {
        User memory u = users[uuid];
        return (
            u.first_name,
            u.last_name,
            u.sex,
            u.age,
            u.birth_day,
            u.addr,
            u.mail_address,
            u.phone_number
        );
    }
}
