function balanceOf(address _user) public{
    uint256 rawBalance = balances[_user];
    if (rawBalance == 0) {
        return 0;
    }

    uint256 startLevel = compoundedInterestFactor[_user];
    uint256 currentLevel = getInterestRate().getCurrentCompoundingLevel(); 
    return _rawBalance.mul(currentLevel).div(startLevel);
}
