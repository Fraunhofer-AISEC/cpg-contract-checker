function GetBalanceTest() public constant returns (uint256)
{
      return token.balanceOf(address(this));
}
