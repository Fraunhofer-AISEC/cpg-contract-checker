modifier payFee() {
   bool sent = payable(address(this)).send(msg.value);
   require(sent, "Didn't receive fee.");
    _;
}

function executeTrade(
    address _tokenA,
    address _tokenB,
    uint _tokensFromFlashLoan,
    bool _startOnUniswap
) external payable payFee {
    uint balanceBefore = IERC20(_tokenA).balanceOf(_tokenA);
    bytes memory data = abi.encode(
        _startOnUniswap,
        _tokenA,
        _tokenB,
        _tokensFromFlashLoan,
        balanceBefore
    );
    flashloan(_tokenA, _tokensFromFlashLoan, data);
}
