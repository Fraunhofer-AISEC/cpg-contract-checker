
function getBalanceOfWethA(address _address, address _account) public view returns (uint256) {
    return ERC20(_address).balanceOf(_account);
}
