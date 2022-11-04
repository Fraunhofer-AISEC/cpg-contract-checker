address contractAddress = this;

function getSummary() public view returns(
    uint, uint, uint, uint, address
){
  return (
    minimumContribution,
    contractAddress.balance,
    requests.length,
    approversCount,
    manager
  );
}
