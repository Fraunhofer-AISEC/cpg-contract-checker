pragma solidity ^0.4.0;
import "github.com/oraclize/ethereum-api/oraclizeAPI_0.4.sol";

contract KrakenPriceTicker is usingOraclize {

    string public ETHXBT;
    uint public timesCalled;
    uint public timesFailed;

    event newOraclizeQuery(string description);
    event newKrakenPriceTicker(string price);


    function KrakenPriceTicker() payable {
        oraclize_setProof(proofType_TLSNotary | proofStorage_IPFS);
    }

    function __callback(bytes32 myid, string result, bytes proof) {
        ETHXBT = result;
        newKrakenPriceTicker(ETHXBT);
        update();
    }

    function update() payable {
        if (oraclize_getPrice("URL") > this.balance) {
            newOraclizeQuery("Oraclize query was NOT sent, please add some ETH to cover for the query fee");
            timesFailed++;
        } else {
            newOraclizeQuery("Oraclize query was sent, standing by for the answer..");
            oraclize_query(60, "URL", "json(https://api.kraken.com/0/public/Ticker?pair=ETHXBT).result.XETHXXBT.c.0");
            timesCalled++;
        }
    }

}
