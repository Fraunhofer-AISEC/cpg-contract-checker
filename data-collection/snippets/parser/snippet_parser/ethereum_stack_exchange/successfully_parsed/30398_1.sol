

pragma solidity ^0.4.0;
import "github.com/oraclize/ethereum-api/oraclizeAPI.sol";

contract DieselPrice is usingOraclize {
    event one(string description);
    event newDieselPrice(string price);


    function DieselPrice() {
        update(); 
    }

    function __callback(bytes32 myid, string result) {
        require(msg.sender != oraclize_cbAddress()); 
        newDieselPrice(result);
        
        
    }

    function update() payable {
        one("Oraclize query was sent, standing by for the answer..");
        oraclize_query("URL", "xml(https://www.fueleconomy.gov/ws/rest/fuelprices).fuelPrices.diesel");
    }

}
