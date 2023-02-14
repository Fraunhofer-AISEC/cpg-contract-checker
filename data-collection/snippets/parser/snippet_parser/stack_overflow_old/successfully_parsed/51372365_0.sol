function getSummary() public view returns(
    uint, uint, uint, uint, address
){
    return (
        minimumContribution,
        this.balance, 
        requests.length,
        approversCount,
        manager
    );
}
