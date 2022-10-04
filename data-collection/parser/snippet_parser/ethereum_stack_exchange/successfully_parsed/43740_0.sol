pragma solidity ^0.4.2;    

import "http://github.com/oraclize/ethereum-api/oraclizeAPI_0.4.sol";

contract MyContract is usingOraclize {

    uint public tmp = 0;
    function callThisToStart() {
        oraclize_query(60, "URL", "");
    }

    function __callback(bytes32 myid, string result) {
        if (msg.sender != oraclize_cbAddress()) throw;
        doSomething();
        callThisToStart();
    }

    function doSomething() {
        tmp++;
    }

}
