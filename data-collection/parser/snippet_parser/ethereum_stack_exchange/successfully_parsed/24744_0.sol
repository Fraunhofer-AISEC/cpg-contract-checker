pragma solidity ^0.4.15;

contract Test {

    address public owner = msg.sender;

    function sendWeis(address _receiver, uint256 _amount) returns (bool) {

        _receiver.transfer(_amount);
        return true;

    }

    function getBalance(address _owner) constant returns (uint256) {

        return _owner.balance;
    }
}
