function __callback(bytes32 queryId, string memory result) public override {
        emit APIResponse(result);
        if (msg.sender != provable_cbAddress()) revert();
        
    }

    function executeAPICall() private {
        if (provable_getPrice("URL") > msg.sender.balance) {
           emit Failure("Provable query was NOT sent, please add some ETH to cover for the query fee");
        } else {
            emit OK("Trying to fetch API..");
            provable_query("URL", "json(http://ip).property");
        }
    }
