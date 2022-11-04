function mint() external {
  require(IERC721(_firstToken).balanceOf(msg.sender) > 0, 'should be a holder of the first token');

  _mint();
}
