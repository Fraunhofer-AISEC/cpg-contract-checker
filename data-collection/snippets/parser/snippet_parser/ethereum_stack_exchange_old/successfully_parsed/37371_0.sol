pragma solidity ^0.4.18;

contract UserToken {
    mapping (bytes32 => uint8) public tokenBalance;

    bytes32[] public userList;

    
    function UserToken(bytes32[] userName) public payable {
        userList = userName;
    }

    
    function totalTokensFor(bytes32 user) view public returns (uint8) {
        require(validUser(user));
        return tokenBalance[user];
    }

    
    function buyToken(bytes32 user, uint8 token) public {
        require(validUser(user));
        tokenBalance[user] += token;
    }

    function validUser(bytes32 user) view public returns (bool) {
        for(uint i = 0; i < userList.length; i++) {
          if (userList[i] == user) {
            return true;
          }
        }

        return false;
    }
}
