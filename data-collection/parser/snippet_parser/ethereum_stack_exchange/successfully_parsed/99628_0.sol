contract SplitFunds is PaymentSplitter {
    constructor (address[] memory payees, uint256[] memory shares)
    PaymentSplitter(payees, shares)
    public payable{}
}
