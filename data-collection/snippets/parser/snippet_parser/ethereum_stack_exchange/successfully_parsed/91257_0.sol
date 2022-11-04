function send(address recipient, uint _amount, uint256 _gas) private {
        (bool success, ) = recipient.call{value:_amount, gas: _gas}("");
        require(success, "Transfer failed.");
    }
