pragma solidity ^0.4.11;
import "./oraclizeAPI.sol"; 

contract ExampleContract is usingOraclize {

string public EURGBP;
event updatedPrice(string price);
event newOraclizeQuery(string description);

function ExampleContract() payable {
    updatePrice();
}

function __callback(bytes32 myid, string result) {
    if (msg.sender != oraclize_cbAddress()) throw;
    EURGBP = result;
    updatedPrice(result);
}

function updatePrice() payable {
    if (oraclize_getPrice("URL") > this.balance) {
        newOraclizeQuery("Oraclize query was NOT sent, please add some ETH to cover for the query fee");
    } else {
        newOraclizeQuery("Oraclize query was sent, standing by for the answer..");
        oraclize_query("URL", "json(http://api.fixer.io/latest?symbols=USD,GBP).rates.GBP");
    }
}
}