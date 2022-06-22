interface Token {
  function getTotalSupply(address _market, TokenType _tokenType) external view returns (uint256);

  function mint(
    address _to,
    uint256 _amount,
    TokenType _tokenType
  ) external;
}
