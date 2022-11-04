pragma solidity ^0.5.8;

import "browser/LoanToken.sol";

contract problem2_bank {
    address private _owner;
    LoanToken public loanToken;
    uint private loansCount = 0;
    uint private guaranteesCount = 0;
    mapping (uint => Loan) private loans;
    mapping (uint => Guarantee) private guarantees;
    mapping (uint => address payable) private lenders;

    constructor(address loanTokenAddress) public 
    {
        _owner = msg.sender;
        loanToken = LoanToken(loanTokenAddress);
    }

    
    

    struct Loan {
        address payable loanee;
        uint etherBorrow;
        uint index;
        uint payBackDate;
        uint etherInterest;
        bool _isGuaranteeProvided;
        bool _isLoanProvided;
        bool _isLoanExist;
    }

    struct Guarantee {
        address payable guarantor;
        uint etherInterest;
        uint loanIndex;
        bool _isWaitingForHandling;
        bool _isGuaranteeExist;
    }

    function getAllowance(address spender) public view returns(uint)
    {
        return loanToken.allowance(msg.sender, spender);
    }

    function giveFifteenthTokens(address spender) public returns(bool)
    {
        require(msg.sender == _owner, "You are not owner of that smart contract");
        require(spender != _owner, "The owner of the smart contract can't receive tokens from himself");

        
        
        

        
        
        
        
        loanToken.transfer(spender, 15);

        return true;
    }

    function getBalanceOfTokens(address account) public view returns(uint)
    {
        return loanToken.balanceOf(account);
    }

    function requestLoan(uint etherBorrow, uint8 payBackDate, uint8 etherInterest) public
    {
        Loan memory loan = Loan({loanee: msg.sender, index: loansCount, etherBorrow: etherBorrow,
                                        payBackDate: now + (payBackDate * 1 days), etherInterest: etherInterest,
                                        _isGuaranteeProvided: false, _isLoanProvided: false, _isLoanExist: true});
        loans[loansCount] = loan;
        loansCount++;
    }

    function provideGuarantee(uint index, uint8 guaranteeInterest) public 
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

    function handleGuarantee(uint index, bool isGuaranteeProvided) public
    {
        require(
            index < loansCount,
            "This index does not exist");

        require(loans[index].loanee == msg.sender, 
            "This is not your loan");

        require(guarantees[index]._isWaitingForHandling,
            "Guarantee already processed");

        require(
            loans[index]._isLoanExist,
            "This loan does not exist");

        require(
            guarantees[index]._isGuaranteeExist,
            "This guarantee does not exist");

        loans[index]._isGuaranteeProvided = isGuaranteeProvided;
        guarantees[index]._isWaitingForHandling = false;

        if(!loans[index]._isGuaranteeProvided){
            guarantees[index].guarantor.transfer(loans[index].etherBorrow); 
            require(
                loanToken.approve(msg.sender, loans[index].etherBorrow),
                            "You don't receive approval from loanToken for this amount");

            require(
            loanToken.transferFrom(_owner, msg.sender, loans[index].etherBorrow),
                            "You don't receive tokens from loanToken for this amount");

            delete guarantees[index];
            guaranteesCount--;
        }
    }

    function getLoansInfo(uint index) public view returns(uint, bool, uint, address payable) {
        require(
            lenders[index] == msg.sender,
            "You are not a leander of this loan");

        require(
            index < loansCount,
            "This index does not exist");

        require(
            loans[index]._isLoanExist,
            "This loan does not exist");

       return(loansCount,   
                loans[index]._isGuaranteeProvided, 
                loans[index].etherBorrow * loans[index].etherInterest / 100,    
                guarantees[index].guarantor);   
    }

    function provideLoanForLoanee(uint index) public payable
    {
        require(
            lenders[index] == address(0),
            "The lender for this loan is already exist");

        require(
            loans[index].loanee != msg.sender,
            "You are not a lender");

        require(
            guarantees[index].guarantor != msg.sender,
            "You are not a lender");

        require(
            index < loansCount,
            "This index does not exist");

        require(
            loans[index]._isGuaranteeProvided,
            "This loan doesn't have a guarantee");

        require(
            !loans[index]._isLoanProvided,
            "This loan is already provided");

        require(
            loans[index]._isLoanExist,
            "This loan does not exist");

        require(
            msg.value == loans[index].etherBorrow,
            "You don't have enough ether");

        require(
            loanToken.allowance(msg.sender, loans[index].loanee) == loans[index].etherBorrow,  
            "You don't have enough ether");

        loans[index].loanee.transfer(loans[index].etherBorrow); 
        loans[index]._isLoanProvided = true;
        lenders[index] = msg.sender;
    }

    function isBorrowerTransferEtherAtTime(uint index) public 
    {
        require(
            lenders[index] != address(0),
            "Loan doesn't have a lender");

        require(
            lenders[index] == msg.sender,
            "You are not leander of this loan");

        require(
            index < loansCount,
            "This index does not exist");

        require(
            loans[index]._isLoanProvided,
            "This loan has not yet been provided");

        require(
            loans[index]._isLoanExist,
            "This loan does not exist");

        
        if(loans[index].payBackDate * 1 days <= now){
            
            lenders[index].transfer(loans[index].etherBorrow); 

            
            delete loans[index];
            loansCount--;

            
            delete guarantees[index];
            guaranteesCount--;

            
            delete lenders[index];
        }
    }

    function payBackLoan(uint index) public payable {
        require(
            index < loansCount,
            "This index does not exist");

        require(loans[index].loanee == msg.sender, 
            "This is not your loan");

        require(
            loans[index]._isLoanProvided,
            "This loan was not provided");

        require(
            loans[index]._isLoanExist,
            "This loan does not exist");

        require(
            guarantees[index]._isGuaranteeExist,
            "This guarantee does not exist");

        uint amount = (loans[index].etherBorrow + loans[index].etherBorrow * guarantees[index].etherInterest / 100) +
                            (loans[index].etherBorrow * loans[index].etherInterest / 100);

        require(
            msg.value == amount, 
            "You should to pay back amount with interest");

        
        guarantees[index].guarantor.transfer(loans[index].etherBorrow + loans[index].etherBorrow * guarantees[index].etherInterest / 100);

        
        lenders[index].transfer(loans[index].etherBorrow + loans[index].etherBorrow * loans[index].etherInterest / 100);

        
        delete loans[index];
        loansCount--;

        
        delete guarantees[index];
        guaranteesCount--;

        
        delete lenders[index];
    }
}
