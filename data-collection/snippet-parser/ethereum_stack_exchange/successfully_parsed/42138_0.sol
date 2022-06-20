pragma solidity ^0.4.11;

import 'https://github.com/oraclize/ethereum-api/oraclizeAPI.sol';

contract Test is usingOraclize {

    uint public tokens;

    uint public dollarCost;


    function() payable {
        updatePrice();
        tokens = msg.value * dollarCost / 1000 / (10 ** 16);
    }


    function __callback(bytes32 myid, string result) {
        if (msg.sender != oraclize_cbAddress()) throw;
        dollarCost = parseInt(result, 3);
    }

    function updatePrice() public payable {

        if (oraclize_getPrice("URL") > this.balance) {
            return;
        }
        else {
          oraclize_query("URL", "json(https://api.coinmarketcap.com/v1/ticker/ethereum/?convert=USD).[0].price_usd");
        }
    }
}
