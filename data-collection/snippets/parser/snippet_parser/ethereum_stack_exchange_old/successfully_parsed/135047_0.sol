function fund(address sender, uint256 amount) public {
      if (amount <= 0) {
           revert FundMe__FundAmountMustBeAboveZero();
      }
      doOtherStuff();
}
