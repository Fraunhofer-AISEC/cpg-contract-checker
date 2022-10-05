function getSummary() public view returns(
    uint, uint, uint, uint, address
){
    return (
        minimumContribution,
        address(contract).balance,
        requests.length,
        approversCount,
        manager
    );
}
