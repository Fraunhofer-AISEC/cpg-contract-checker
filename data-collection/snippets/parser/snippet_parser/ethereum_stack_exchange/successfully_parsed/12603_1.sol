pragma solidity ^0.4.8;

contract A {
    function A() payable {
    }

    function fundTransfer(address b, uint256 amt) {
       bool ret = b.send(amt);
    }    

    function getBalance() constant returns (uint256 balance) {
        balance = this.balance;
    }
}

contract B {
    function getBalance() constant returns (uint256 balance) {
        balance = this.balance;
    }

    function () payable {
    }
}
