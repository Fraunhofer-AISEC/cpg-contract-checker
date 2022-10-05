    pragma solidity ^0.4.18;
    import "github.com/oraclize/ethereum-api/oraclizeAPI.sol";

    contract WolframAlpha is usingOraclize { 



    string public temperature;
    mapping(bytes32=>bool) validIds;
    event LogNewOraclizeQuery(string description);
    event newTemperatureMeasure(string temperature);

    function WolframAlpha() {
        update();
    }

    function __callback(bytes32 myid, string result) {
        require(validIds[myid] ==true);
        require(msg.sender == oraclize_cbAddress());       
        temperature = result;
        newTemperatureMeasure(temperature);
        delete validIds[myid];
        
    }

    function update() payable {
        if(oraclize_getPrice("WolframAlpha") > this.balance){
            LogNewOraclizeQuery("Oraclize query was NOT sent, please add some ETH to cover for the query fee");
        }
        else{
            LogNewOraclizeQuery("Oraclize query was sent, standing by for the answer..");
            bytes32 queryId = oraclize_query(60,"WolframAlpha","Temperature in London");
            validIds[queryId] =true;
        }
    }
} 
