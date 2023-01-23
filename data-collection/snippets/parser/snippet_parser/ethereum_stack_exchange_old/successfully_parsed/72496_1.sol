contract B {

  function funcB(uint256 arg1, uint256 arg2) public pure returns(bool) {
    if (arg1 > 10 && arg2 > 90) {
        return true;
    } else {
        return false;
    }
  }
}
