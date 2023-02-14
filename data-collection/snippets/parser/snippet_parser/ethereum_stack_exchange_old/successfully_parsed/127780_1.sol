contract seeing {
  function see() public view returns (bool) {
    uint s = FirstContract(_contract).taker()
    return true;
  }
}
