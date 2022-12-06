pragma solidity ^0.5.0;

    import "./oraclizeAPI.sol";

    contract ETHUSD is usingOraclize {

        string public priceETHUSD;

        event LogNewCoinBaseOraclizeQuery(string description);
        event LogNewCoinBaseTicker(string price);

        constructor() public {
            oraclize_setProof(proofType_Android | proofStorage_IPFS);
            update(); 
        }

        function __callback(bytes32 _myid, string memory _result, bytes memory _proof) public {
            require(msg.sender == oraclize_cbAddress());
            update(); 
            priceETHUSD = _result;
            emit LogNewCoinBaseTicker(priceETHUSD);
        }

        function update() public payable {
            if (oraclize_getPrice("URL") > address(this).balance) {
                emit LogNewCoinBaseOraclizeQuery("Oraclize query was NOT sent, please add some ETH to cover for the query fee!");
            } else {
                emit LogNewCoinBaseOraclizeQuery("Oraclize query was sent, standing by for the answer...");
                oraclize_query(5, "URL", "json(https://api.pro.coinbase.com/products/ETH-USD/ticker).price");
            }
        }
    }
