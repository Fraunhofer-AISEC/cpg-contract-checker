function getAvailableAllocation(address _addr)
  constant
  returns (uint ethAvailableAllocation)
{
  return investorActions.getAvailableAllocation(_addr);
}
