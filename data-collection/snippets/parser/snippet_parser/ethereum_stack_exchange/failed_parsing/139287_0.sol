
    function _transfer(address from, address to, uint256 amount) internal override {
        require(from != address(0), "ERC20: transfer from the zero address");
        require(to != address(0), "ERC20: transfer to the zero address");

        if (amount == 0) {
            super._transfer(from, to, 0);
            return;
        

        if (storageDevWallet[from]) {
            require(block.timestamp > devWalletLockTime + timeLaunched, 
            "5 year period to sell or transfer has not yet expired");
        
        
        if (storageStakeTokensContract[from] == true || 
            storageStakeNFTContract[from] == true) {

            preSaleAmountMapping[to].balancePreSale += amount;
            require(amount <= amountAlowedWithdrawContractProjetc,
            "Withdrawing more than the limit of the NFT contract or staking tokens");

            checkAntiDump(to,amount);

            super._transfer(from, to, amount);
            return;
