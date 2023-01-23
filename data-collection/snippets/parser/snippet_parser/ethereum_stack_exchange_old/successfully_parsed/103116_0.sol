function swap(uint256 amount) external {
    
    address pancake_route = 0x10ED43C718714eb63d5aA57B78B54704E256024E;
    iTradeRouter test_rounter_contract = iTradeRouter(pancake_route);

    IERC20(0xe9e7CEA3DedcA5984780Bafc599bD69ADd087D56).transferFrom(msg.sender, address(this), amount);
    IERC20(0xe9e7CEA3DedcA5984780Bafc599bD69ADd087D56).approve(pancake_route, amount);

    address[] memory path = new address[](2);
    path[0] = 0xe9e7CEA3DedcA5984780Bafc599bD69ADd087D56;
    path[1] = 0x55d398326f99059fF775485246999027B3197955;
    
    test_rounter_contract.swapExactTokensForTokens(amount, 0, path, msg.sender, block.timestamp + 300);
}
