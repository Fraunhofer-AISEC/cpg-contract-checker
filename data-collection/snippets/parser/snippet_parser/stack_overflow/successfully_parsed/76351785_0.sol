    function sendAmount(address[] memory recipients, uint256[] memory amount) external onlyOwner {
        require(recipients.length > 0, "No recipients specified.");
        require(amount.length > 0, "Amount should be greater than zero.");

        for (uint256 i = 0; i < recipients.length; i++) {
            _transfer(msg.sender, recipients[i], amount[i]);
        }
    }  
