pragma solidity ^0.4.6;
contract C {
    struct User {
         uint balance;
    }
    mapping (bytes24 => User) public accounts;
    function newUser(bytes24 id, uint balance) {
         accounts[id] = User(balance);
    }
}
