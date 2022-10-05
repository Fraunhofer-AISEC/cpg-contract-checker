constructor(string _fname, address _tokenInstance) public {
  tokenInstance = MyToken(_tokenInstance);
  faucetName = _fname;
  faucetStatus = true;

  emit FaucetOn(faucetStatus);
}
