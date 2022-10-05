pragma solidity ^0.5.8;


import "github.com/oraclize/ethereum-api/oraclizeAPI.sol";

contract DieselPrice is usingOraclize {

    uint public dieselPriceUSD;
    string public re;

    event LogNewDieselPrice(string price);
    event LogNewOraclizeQuery(string description);

    constructor() public {
        update(); 
    }

    function __callback(bytes32 myid, string memory result) public {
        
        emit LogNewDieselPrice(result);
        re = result;
        
        
        
    }

    function update() public payable {
        emit LogNewOraclizeQuery("Oraclize query was sent, standing by for the answer...");
        oraclize_query("URL", "xml(http://rss.cnn.com/rss/cnn_topstories.rss).rss.channel.item.0.title","asd");
    }
}
