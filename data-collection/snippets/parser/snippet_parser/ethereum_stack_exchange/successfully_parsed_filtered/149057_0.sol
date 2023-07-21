   function batchTransfer(address[] memory receivers, uint256[] memory amounts)
        external
        onlyOwner
    {
        for (uint256 i = 0; i < receivers.length; i++) {
            _transfer(receivers[i], amounts[i]);
        }
    }
