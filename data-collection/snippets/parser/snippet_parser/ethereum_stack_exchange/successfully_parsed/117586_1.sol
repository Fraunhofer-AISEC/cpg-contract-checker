uint256 private interestPercentage  = 2;
function calculateInterest( uint256 _loanAmount) public view returns (uint256) {
   return _loanAmount * (100 + interestPercentage) / 100 - _loanAmount;
}
