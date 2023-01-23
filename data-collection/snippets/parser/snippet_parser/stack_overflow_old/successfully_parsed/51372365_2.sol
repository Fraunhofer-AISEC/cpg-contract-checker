function getSummary() public view returns(
    uint, uint, uint, uint, address
){
    return (
        minimumContribution,
        address(this).balance,
        requests.length,
        approversCount,
        manager
    );
}
