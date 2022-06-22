pragma solidity ^0.4.0;
import "github.com/oraclize/ethereum-api/oraclizeAPI.sol";

contract Ballot is usingOraclize {
    function test() {
        oraclize_query("URL", "https://api.kraken.com/0/public/Ticker?pair=ETHXBT");
    }    
}
