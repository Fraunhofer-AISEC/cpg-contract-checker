pragma solidity ^0.4.13;

contract Test {

    

    
    function deposite() payable{

    }

    function sendWeis(address _receiver,uint256 _amount) returns (bool) {
        require(this.balance >= _amount);
        _receiver.transfer(_amount);
        return true;
    }

    function getBalance(address _owner) constant returns (uint256) {
        return _owner.balance;
    }

}
