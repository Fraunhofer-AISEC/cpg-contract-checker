pragma solidity ^0.4.2;

import "usingOraclize.sol";

contract SimpleDice is usingOraclize {
    address owner;
    mapping (bytes32 => address) bets;

    function SimpleDice(){
        owner = msg.sender;
    }

    function() payable {
        if (msg.sender != owner) throw;
    }

    function __callback(bytes32 myid, string result) {
        if (msg.sender != oraclize_cbAddress()) throw;
        if (uint(bytes(result)[0]) - 48 > 3) {
            if (bets[myid].send(2 wei)) {
                log0("winner");
            }
        }
    }

    function bet() payable {
        rollDice();
    }

    function rollDice() {
        bytes32 myid = oraclize_query("WolframAlpha", "random number between 1 and 6");
        bets[myid] = msg.sender;
    }    

    function kill(){
        if (msg.sender == owner) suicide(msg.sender);
    }
}
