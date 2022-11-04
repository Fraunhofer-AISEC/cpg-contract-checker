function getUserName(uint256 uuid) constant returns (bytes32, bytes32) {
    return (
    users[uuid].first_name,
    users[uuid].last_name
    );
}

function getUserDetails(uint256 uuid) constant returns (bytes32, bytes32, bytes32, bytes32, bytes32, bytes32) {
    return (
    users[uuid].sex,
    users[uuid].age,
    users[uuid].birth_day,
    users[uuid].address,
    users[uuid].mail_address,
    users[uuid].phone_number
    );
}
