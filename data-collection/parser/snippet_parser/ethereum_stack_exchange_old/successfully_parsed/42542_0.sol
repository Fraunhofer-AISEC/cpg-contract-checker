pragma solidity ^0.4.21;

contract PasswordTimeLock {
    uint timelock;
    bytes32 hashlock;
    address owner;
    string data = "hello world";

    function PasswordTimeLock(string _password) public {
        owner = msg.sender;
        hashlock = keccak256(owner, _password);
    }

    function unlock(string _password) public returns (bool) {
        require(keccak256(owner, _password) == hashlock);
        timelock = now + 20 seconds;
        return true;
    }

    function read() public view returns (string) {
        require(now < timelock);
        return data;
    }
}
