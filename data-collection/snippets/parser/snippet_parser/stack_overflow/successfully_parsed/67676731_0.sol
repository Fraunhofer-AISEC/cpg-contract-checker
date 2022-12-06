
function increaseSupply(uint256 _value) public onlySupplyController returns (bool success) {
    totalSupply_ = totalSupply_.add(_value);
    balances[supplyController] = balances[supplyController].add(_value);
    emit SupplyIncreased(supplyController, _value);
    emit Transfer(address(0), supplyController, _value);
    return true;
}
