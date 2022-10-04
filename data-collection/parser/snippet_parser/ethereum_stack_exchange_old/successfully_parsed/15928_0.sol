pragma solidity ^0.4.11;

contract Test {
    Receiver myR;

    function setReceiver (address a) {
        myR = Receiver(a);
    }

    function callR() {
        myR.call(this.balance);
    }

    function sendCash() payable {
    }

}

contract Receiver {
    uint public numCalled;

    function () payable {
        numCalled++;
    }
}
