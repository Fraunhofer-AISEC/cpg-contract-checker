    function depositDAI() external payable {
        require(msg.value >= amount, "Insufficient funds");
        transferFunds(DAI, 10**18);
    }

    function depositUSDC() external payable {
        require(msg.value >= amount, "Insufficient funds");
        transferFunds(USDC, 10**6);
    }
    
    function depositUSDT() external payable {
        require(msg.value >= amount, "Insufficient funds");
        transferFunds(USDT, 10**6);
    }
