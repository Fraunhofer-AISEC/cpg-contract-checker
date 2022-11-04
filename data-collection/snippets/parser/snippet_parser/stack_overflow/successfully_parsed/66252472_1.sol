address payable public spender;

constructor(uint256 _potentialPayoutAmount) {
  autoDeposit(_potentialPayoutAmount)
}

function autoDeposit(uint256 _potentialPayoutAmount) {
  depositedFor[receiver] = depositedFor[receiver] + _potentialPayoutamount;
}
