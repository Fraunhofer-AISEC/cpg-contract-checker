contract B {

  function funcB(uint256 arg1) public pure returns(bool) {
    if (arg1 > 10) {
        return true;
    } else {
        return false;
    }
  }
}
