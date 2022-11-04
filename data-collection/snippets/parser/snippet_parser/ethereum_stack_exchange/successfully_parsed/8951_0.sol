pragma solidity 0.4.2;

contract mortal {
    address owner;

    function mortal() { owner = msg.sender; }

    function kill() { if (msg.sender == owner) suicide(owner); }
}

contract myEscrow is mortal {
    uint numEscrows;

    function queryNumEscrows() constant returns (uint) {
        return numEscrows;
    }

    function start() returns (uint) {
        numEscrows++;

        return numEscrows;
    }

}
