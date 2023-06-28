contract mContract {

function verify(string memory _user, string memory _passwd) public view {
require(
      (keccak256(bytes(userMap[_user].user)) == keccak256(bytes(_user))) &&
      (keccak256(bytes(userMap[_user].passwd)) == keccak256(bytes(_passwd))),
      "Invalid"
);
}
}