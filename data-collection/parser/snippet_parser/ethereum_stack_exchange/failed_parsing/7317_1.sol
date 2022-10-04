struct User{
    uint256 user_id;
    bytes32 name;
    bytes32 address;
    bytes32 birth_day;
}
mapping (uint256 => User) public users;

function getUser(uint256 user_id) constant returns (uint) {
return users[user_id].user_id;

}
