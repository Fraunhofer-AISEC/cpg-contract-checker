pragma solidity 0.5.0;

import "github.com/oraclize/ethereum-api/oraclizeAPI.sol";

contract EthPriceTicker is usingOraclize {

    string public ethPriceUSD;

    event LogEthPrice(string priceUSD);

    function __callback(bytes32 myid, string memory result, bytes memory proof) public {
        require(msg.sender == oraclize_cbAddress());
        ethPriceUSD = result;
        emit LogEthPrice(result);
    }

    function getEthPriceInUSD() public payable {
        oraclize_query("URL", "json(https://min-api.cryptocompare.com/data/price?fsym=ETH&tsyms=USD,EUR,JPY).USD");
    }
}
