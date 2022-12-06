function requestLoan(uint etherBorrow, uint8 payBackDate, uint8 
etherInterest) public
{
    Loan memory loan = Loan({loanee: msg.sender, index: loansCount, etherBorrow: etherBorrow,
                                    payBackDate: now + (payBackDate * 1 days), etherInterest: etherInterest,
                                    _isGuaranteeProvided: false, _isLoanProvided: false, _isLoanExist: true});
    loans[loansCount] = loan;
    loansCount++;
}

function provideGuarantee(uint index, uint8 guaranteeInterest) public payable 
{
    require(
        index < loansCount,
        "This index does not exist");

    require(loans[index].loanee != msg.sender,
            "The borrower can't provide a guarantee to himself");

    require(lenders[index] != msg.sender,
            "The lender can't provide guarantee for the loan");

    require(!loans[index]._isGuaranteeProvided, 
        "This loan already has a guarantee");

    require(guaranteesCount < loansCount || !guarantees[index]._isWaitingForHandling, 
        "This guarantee already waiting for handling of borrower");

    require(guaranteeInterest > 0, 
            "Too low interest");

    require(
        msg.value == loans[index].etherBorrow,
        "You don't have enough eather to provide guarantee");

    require(
        loans[index]._isLoanExist,
        "This loan does not exist");

    require(
        !guarantees[index]._isGuaranteeExist,
        "This guarantee does exist");

    Guarantee memory guarantee = Guarantee({guarantor: msg.sender, etherInterest: guaranteeInterest,
                                                loanIndex: index, _isWaitingForHandling: true, _isGuaranteeExist: true});
    guarantees[index] = guarantee;
    guaranteesCount++;
}
