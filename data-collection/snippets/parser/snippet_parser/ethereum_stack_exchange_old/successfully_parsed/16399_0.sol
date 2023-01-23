pragma solidity ^0.4.0;

contract Test {

    function() payable {}

    function getBalance() public constant returns(uint bal) {
        bal = this.balance;
        return bal;
    }

} 
