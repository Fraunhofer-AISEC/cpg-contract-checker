contract TestHelper {
    FundMe fundMeContract;
    bool public callResponse;

    constructor(address priceFeedAddress) {
        fundMeContract = new FundMe(priceFeedAddress);
    }

    
    
    function initialFunding() public payable {}

    
    function fundMeFund(uint256 sendValue) public payable {
        (bool callSuccess, ) = address(fundMeContract).call{ value: sendValue }(
            ""
        );
        callResponse = callSuccess;
    }

    
    
    function fundMeWithdraw() public payable {
        fundMeContract.withdraw();
    }
}
