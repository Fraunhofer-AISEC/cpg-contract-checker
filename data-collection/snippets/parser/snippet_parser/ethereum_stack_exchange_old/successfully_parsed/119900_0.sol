uint256 interestRate = 2;
uint256 principle = 500;
uint256 interest = ((principle * (100 + interestRate)) / 100) - principle;
uint256 repaymentAmount = principle + interest;
