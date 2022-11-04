pragma solidity ^0.4.0;
import "github.com/oraclize/ethereum-api/oraclizeAPI.sol";

contract WolframAlpha is usingOraclize {

    string public timestamp;

    event newOraclizeQuery(string description);
    event newTimestampMeasure(string timestamp);

    function WolframAlpha() {
        update();
    }

    function __callback(bytes32 myid, string result) {
        if (msg.sender != oraclize_cbAddress()) throw;
        timestamp = result;
        newTimestampMeasure(timestamp);
    }

    function update() payable {
        newOraclizeQuery("Oraclize query was sent, standing by for the answer..");
        oraclize_query("WolframAlpha", "Timestamp now");
    }
} 
