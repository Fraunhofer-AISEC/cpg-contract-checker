pragma solidity ^0.4.8;

contract A {

    function A () payable {

    }

    event balanc(uint a);

    function fundTransfer(address b,uint amt) {
       bool ret = b.send(amt);
    }    

    function getBalance() {
        balanc(this.balance);
    }
}

contract B {

    event balanc(uint a);

    function getBalance() {
        balanc(this.balance);
    }
}
