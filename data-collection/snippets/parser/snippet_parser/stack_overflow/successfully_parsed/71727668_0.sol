function swapERC20ForETH(uint256 tokenAmount, address from, address to) override payable public returns(uint256 ETHSwapped){
    require(msg.sender != address(0), "sender should be valorized");
    require(tokenAmount > 0, "Token Amount should be greater than 0");

    (uint256 tokenReserve, uint256 ETHReserve) = getReserves();
    require(tokenReserve > 0 && ETHReserve > 0, "not enough liquidity");

    uint256 ETHAmountSwaped = quote(tokenAmount, tokenReserve, ETHReserve);
    require(ETHAmountSwaped > 0, "swapped amount should be greater than 0");
    require(ETHAmountSwaped < address(this).balance, "swap will drain liquidity");

    if (_token.transferFrom(from, address(this), tokenAmount)) {
        (bool success, ) = to.call{value: ETHAmountSwaped}("");
        require(success, "Failed to send Ether");
        _tokenReserve += tokenAmount;
        _ETHReserve -= ETHAmountSwaped;
    }

    ETHSwapped = ETHAmountSwaped;
}
