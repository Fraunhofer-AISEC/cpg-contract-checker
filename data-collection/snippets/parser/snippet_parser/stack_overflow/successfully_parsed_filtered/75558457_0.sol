    function buy(uint256 id) public payable returns(uint256) {
        require(msg.value >= listPrice[id], "Insufficient Bid");
        bytes memory payload = abi.encodeWithSignature("transfer(uint256,address)", id, msg.sender);
        
        (bool success,) = address(diceContract).delegatecall(payload);
        require(success, "Transfer failed");

        diceMarket.transfer(msg.value);

        if (msg.value > listPrice[id]) {
            msg.sender.transfer(msg.value - listPrice[id]);
        }

        return listPrice[id];
    }
