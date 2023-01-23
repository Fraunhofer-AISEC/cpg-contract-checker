pragma solidity ^0.4.2;    

import "http://github.com/oraclize/ethereum-api/oraclizeAPI_0.4.sol";

contract MyContract is usingOraclize {

    function callThisToStart() {
        oraclize_query(1*day, "URL", "");
    }

    function __callback(bytes32 myid, string result) {
        if (msg.sender != oraclize_cbAddress()) throw;
        doSomething();
        callThisToStart();
    }

    function doSomething() {
        
    }

}
