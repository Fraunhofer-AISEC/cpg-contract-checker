pragma solidity 0.5;
pragma experimental ABIEncoderV2;
contract TestStruct {

      struct User {
        string name;
        uint256 age;
     }

    mapping (bytes32 => User) users;

    function addUsers (User [] memory _users) public {

        for (uint i = 0; i < _users.length; i++) {

           bytes32 hash = keccak256(abi.encode(_users[i].name));
           users[hash] = _users[i];

        }
    }

    function getUser (string memory username) public view returns (User memory) {

        bytes32 hash = keccak256(abi.encode(username));

        return users[hash];
    }
}
