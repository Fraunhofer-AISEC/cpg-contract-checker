function _buyGuns() public payable returns (uint256) {
    address[] memory path = new address[](2);
    path[0] = _router.WETH();
    path[1] = address(this);
    uint deadline = block.timestamp + 300; 
    address addr = payable(address(this)); 
    uint[] memory tokenAmount_ = _router.swapExactETHForTokens{value: msg.value}(
        0, 
        path, 
        addr, 
        deadline
    );
    uint256 outputTokenCount = uint256(tokenAmount_[tokenAmount_.length - 1]);
    return (outputTokenCount);
}
