   function claimDividend(address payable account) public onlyOwner returns (bool) {
    uint256 amount = _withdrawDividendOfUser(account);

    if(amount > 0) {
        emit Claim(account, amount);
        return true;
    }

    return false;
}
