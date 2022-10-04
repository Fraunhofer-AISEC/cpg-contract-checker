
pragma solidity ^0.7.3;

    function buy() public payable {
        require((block.timestamp > startTime ) && (block.timestamp < endTime)  , " Token Crowdsate is not active");
        uint256 weiValue = msg.value;
        require((weiValue >= minimumBuyAmount) && (weiValue <= maximumBuyAmount), "Minimum amount is 0.1 eth / Maximum amount is 1 eth ");
        uint256 amount = weiValue.mul(priceFactor);
        Token token = Token(tokenAddress);
        require(walletAddress.send(weiValue));
        require(token.tokensSold(msg.sender, amount));
        totalSold += amount;
        emit TokensSold(msg.sender, amount);
    }
}
