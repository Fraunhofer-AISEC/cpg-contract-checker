
function decreaseSupply(uint256 _value) public onlySupplyController returns (bool success) {
    require(_value <= balances[supplyController], "not enough supply");
    balances[supplyController] = balances[supplyController].sub(_value);
    totalSupply_ = totalSupply_.sub(_value);
    emit SupplyDecreased(supplyController, _value); 
    emit Transfer(supplyController, address(0), _value);
    return true;
}
