pragma solidity ^0.4.13;

contract NotSoSecret {

    bytes32 public secretHash;

    

    function deposit(bytes32 _secretHash) public payable returns(bool success) {
        secretHash = _secretHash;
        return true;
    }

    

    function claim(bytes32 password) public returns(bool success) {
        if(sha3(password) == secretHash) {
            msg.sender.transfer(this.balance);
            return true;
        }
        return false;

    }
}
