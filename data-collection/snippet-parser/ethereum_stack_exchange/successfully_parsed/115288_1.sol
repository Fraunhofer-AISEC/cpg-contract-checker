function batchTransferEth(
        address payable [] memory addresses,
        uint256[] memory amounts,
        uint256 gas,
        uint256 length
    ) external payable onlyAuthAccount nonReentrant {
        uint256 totalAmount = 0;
        require(addresses.length == length, "wrong number of addresses");
        require(amounts.length == length, "wrong number of amounts");
        for (uint256 i = 0; i < length; i++) {
            totalAmount += amounts[i];
        }
        require(totalAmount == msg.value, "insufficient total value to send");
        for (uint256 i = 0; i < length; i++) {
            
            Address.sendValueGas(addresses[i], amounts[i], gas);
            
            emit Transfer(address(0), msg.sender, addresses[i], amounts[i]);
        }
    } 
