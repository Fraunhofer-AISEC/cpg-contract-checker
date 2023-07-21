uint128 private constant _initialSupply = 1_000_000_000_000_000 ether;
uint128 private constant _yearlySupplyIncrease = 10_000_000_000 ether;
uint128 private constant _reflectionFeePercentage = 1;
uint128 private constant _burnFeePercentage = 2;

constructor() {
    _totalSupply = _initialSupply;
    _balances[msg.sender] = _initialSupply;
    emit Transfer(address(0), msg.sender, _initialSupply);

    require(_totalSupply >= 0, "Error: Invalid total supply");
    require(_balances[msg.sender] == _initialSupply, "Error: Initial supply not assigned correctly");
}
