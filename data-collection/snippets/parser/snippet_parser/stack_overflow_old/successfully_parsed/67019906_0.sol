
function transferWeth(address acc, address _token, uint256 _amount) public payable{
    ERC20 wethToken1 = ERC20(_token);
    wethToken1.approve(acc, _amount);
    require(wethToken1.transferFrom(acc, address(this), _amount), "Don't have enough balance");
}
