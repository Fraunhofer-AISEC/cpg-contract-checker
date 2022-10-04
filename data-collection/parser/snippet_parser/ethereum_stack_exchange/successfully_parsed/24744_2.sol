pragma solidity ^0.4.13;

contract Test {

    

    
    function deposite() payable{

    }

    
    function sendWeis(address _receiver) payable returns (bool) {
        _receiver.transfer(msg.value);
        return true;
    }

    function getBalance(address _owner) constant returns (uint256) {
        return _owner.balance;
    }

}
