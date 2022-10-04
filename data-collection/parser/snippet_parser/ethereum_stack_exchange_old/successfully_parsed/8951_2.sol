pragma solidity 0.4.2;

contract Mortal {
    address owner;

    function Mortal() { owner = msg.sender; }

    function kill() { if (msg.sender == owner) suicide(owner); }
}

contract MyEscrow is Mortal {
    uint numEscrows;

    function queryNumEscrows() constant returns (uint) {
        return numEscrows;
    }

    function start() returns (uint) {
        numEscrows++;
        return numEscrows;
    }
}
