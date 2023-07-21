function buyTokens(address payable _beneficiary, uint256 usdtAmount) public payable {

    require(_beneficiary != address(0), "Invalid beneficiary address");
    require(usdtAmount > 0, "Invalid amount of USDT");

    
    uint256 clsAmount = usdtAmount * rate;

    
    uint256 usdtAllowance = usdtToken.allowance(msg.sender, address(this));
    require(usdtAllowance >= usdtAmount, "Insufficient USDT allowance");

    
    require(usdtToken.transferFrom(msg.sender, wallet, usdtAmount), "USDT transfer failed");
    usdtBalance += usdtAmount;

    
    uint256 clsAllowance = clsToken.allowance(wallet, address(this));
    require(clsAllowance >= clsAmount, "Insufficient CLS allowance");

    
    require(clsToken.transferFrom(wallet, _beneficiary, clsAmount), "CLS transfer failed");

    emit TokensPurchased(msg.sender, _beneficiary, usdtAmount, clsAmount);
}
