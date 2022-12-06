struct  User{
    uint256 uuid;
    bytes32 first_name;
    bytes32 last_name;
    bytes32 sex;
    bytes32 age;
    bytes32 birth_day;
    bytes32 address;
    bytes32 mail_address;
    bytes32 phone_number;
 }

function getUser(uint256 uuid) constant returns (bytes32, bytes32, bytes32, bytes32, bytes32, bytes32, bytes32, bytes32) {
    return (
    users[uuid].first_name,
    users[uuid].last_name,
    users[uuid].sex,
    users[uuid].age,
    users[uuid].birth_day,
    users[uuid].address,
    users[uuid].mail_address,
    users[uuid].phone_number
    );
}
