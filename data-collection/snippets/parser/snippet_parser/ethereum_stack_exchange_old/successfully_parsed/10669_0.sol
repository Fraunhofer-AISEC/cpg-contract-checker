pragma solidity ^0.4.6;
contract C {
    struct User {
         uint balance;
    }
    mapping (string => User) public accounts;
    function newUser(string id, uint balance) {
         accounts[id] = User(balance);
    }
}
