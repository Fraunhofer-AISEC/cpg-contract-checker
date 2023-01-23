
address payable private trustToken;
address private proposalManagement;


mapping(address => uint256) private userRequestCount;
mapping(address => uint256) private userOfferCount;
mapping(address => bool) private validLoanAd;
mapping(address => bool) private openLoan;
address[] private loanRequests;
address[] private loanOffers;


mapping(address => uint256) public borrowerRatings;
mapping(address => uint256) public lenderRatings;


event LoanRequested();

event LoanOffered();

event LoanGranted();


event LoanDisbursed();

event LoanSettled();


constructor(
    address payable _trustToken,
    address _proposalManagement) public {
    trustToken = _trustToken;
    proposalManagement = _proposalManagement;
    ProposalManagementInterface(proposalManagement).setLoanManagement(address(this));
}


function createLoanRequest(
    uint256 _principalAmount,
    uint256 _paybackAmount,
    string memory _purpose,
    address _collateralToken,
    uint256 _collateralAmount,
    uint256 _duration) public {

    
    require(_principalAmount > 0, "Principal amount must be greater than 0");
    require(_paybackAmount > _principalAmount, "Payback amount must be greater than principal");
    require(userRequestCount[msg.sender] < 5, "Too many loan requests made");
    require(_collateralToken == address(trustToken), "Only BBET is currently supported as a collateral token");
    require(_duration >= 60 * 60 * 12, "Loan duration must be at least 12 hours");

    
    bool borrowerVerified = TrustTokenInterface(address(trustToken)).isTrustee(msg.sender);
    borrowerVerified = borrowerVerified || ProposalManagementInterface(proposalManagement).memberId(msg.sender) != 0;
    require(borrowerVerified, "Must be a DFND holder to request loans");

    
    uint256 contractFee = ProposalManagementInterface(proposalManagement).contractFee();

    
    require(IERC20(_collateralToken).balanceOf(msg.sender) > _collateralAmount, "Insufficient collateral in account");

    
    address loan = address(
        new Loan(
            payable(proposalManagement), trustToken, address(0), msg.sender,
            _principalAmount, _paybackAmount, contractFee, _purpose,
            _collateralToken, _collateralAmount, _duration
        )
    );

    
    userRequestCount[msg.sender]++;

    
    loanRequests.push(loan);

    
    validLoanAd[loan] = true;

    
    

    
}


function createLoanOffer(
    uint256 _principalAmount,
    uint256 _paybackAmount,
    string memory _purpose,
    address _collateralToken,
    uint256 _collateralAmount,
    uint256 _duration) public {

    
    require(_principalAmount > 0, "Principal amount must be greater than 0");
    require(_paybackAmount > _principalAmount, "Payback amount must be greater than principal");
    require(userOfferCount[msg.sender] < 5, "Too many loan offers made");
    require(_collateralToken == address(trustToken), "Only BBET is currently supported as a collateral token");
    require(_duration >= 60 * 60 * 12, "Loan duration must be at least 12 hours");

    
    bool lenderVerified = TrustTokenInterface(address(trustToken)).isTrustee(msg.sender);
    lenderVerified = lenderVerified || ProposalManagementInterface(proposalManagement).memberId(msg.sender) != 0;
    require(lenderVerified, "Must be a DFND holder to offer loans");

    
    uint256 contractFee = ProposalManagementInterface(proposalManagement).contractFee();

    
    require(IERC20(trustToken).balanceOf(msg.sender) > _principalAmount, "Insufficient balance to offer this loan");

    
    address loan = address(
        new Loan(
            payable(proposalManagement), trustToken, msg.sender, address(0),
            _principalAmount, _paybackAmount, contractFee, _purpose,
            _collateralToken, _collateralAmount, _duration
        )
    );

    
    userOfferCount[msg.sender]++;

    
    loanOffers.push(loan);

    
    validLoanAd[loan] = true;

    
    
}


function acceptLoanOffer(address payable _loanOffer) public payable {
    
    require(validLoanAd[_loanOffer], "Invalid loan");
    LoanInterface loan = LoanInterface(_loanOffer);
    LoanInterface.LoanParams memory loanParams = loan.getLoanParameters();

    
    bool borrowerVerified = TrustTokenInterface(address(trustToken)).isTrustee(msg.sender);
    borrowerVerified = borrowerVerified || ProposalManagementInterface(proposalManagement).memberId(msg.sender) != 0;
    require(borrowerVerified, "DFND balance insufficient or account not verified to accept loan offers");

    
    if (loanParams.collateralAmount > 0) {
        require(IERC20(loanParams.collateralToken).allowance(msg.sender, _loanOffer) < loanParams.collateralAmount, "Borrower must approve spending of collateral before accepting the loan");
    }

    
    if (TrustTokenInterface(address(trustToken)).balanceOf(loanParams.lender) >= loanParams.principalAmount) {
        cancelLoanAd(_loanOffer, msg.sender);
        
        return;
    }

    
    if (loanParams.collateralAmount > 0) {
        IERC20(loanParams.collateralToken).transferFrom(msg.sender, _loanOffer, loanParams.collateralAmount);
    }

    
    ProposalManagementInterface(proposalManagement).transferTokensFrom(loanParams.lender, msg.sender, loanParams.principalAmount);

    
    Loan(_loanOffer).managementAcceptLoanOffer(msg.sender);

    
    removeLoanOffer(_loanOffer, loanParams.borrower);
    openLoan[_loanOffer] = true;

    
    
}


function acceptLoanRequest(address _loanRequest) public payable {
    
    require(validLoanAd[_loanRequest], "Invalid loan");
    LoanInterface loan = LoanInterface(_loanRequest);
    LoanInterface.LoanParams memory loanParams = loan.getLoanParameters();

    
    bool lenderVerified = TrustTokenInterface(address(trustToken)).isTrustee(msg.sender);
    lenderVerified = lenderVerified || ProposalManagementInterface(proposalManagement).memberId(msg.sender) != 0;
    require(lenderVerified, "DFND balance insufficient or account not verified");

    
    require(TrustTokenInterface(address(trustToken)).balanceOf(msg.sender) >= loanParams.principalAmount, "DFND balance insufficient");

    
    if (loanParams.collateralAmount > 0) {
        if (IERC20(loanParams.collateralToken).allowance(loanParams.borrower, _loanRequest) < loanParams.collateralAmount) {
            cancelLoanAd(_loanRequest, msg.sender);
            
            return;
        }
    }

    
    if (loanParams.collateralAmount > 0) {
        IERC20(loanParams.collateralToken).transferFrom(address(loanParams.borrower), _loanRequest, loanParams.collateralAmount);
    }

    
    ProposalManagementInterface(proposalManagement).transferTokensFrom(msg.sender, loanParams.borrower, loanParams.principalAmount);

    
    Loan(_loanRequest).managementAcceptLoanRequest(msg.sender);

    
    removeLoanRequest(_loanRequest, loanParams.borrower);
    openLoan[_loanRequest] = true;

    
    
}


function repayLoan(address _loan) public {
    
    LoanInterface loan = LoanInterface(_loan);
    LoanInterface.LoanParams memory loanParams = loan.getLoanParameters();
    require(msg.sender == loanParams.borrower, "Only the borrower may repay their loan");

    
    require(TrustTokenInterface(trustToken).balanceOf(msg.sender) >= loanParams.paybackAmount + loanParams.contractFee,
        "Insufficient balance");

    
    ProposalManagementInterface(proposalManagement).transferTokensFrom(msg.sender, loanParams.lender, loanParams.paybackAmount);

    
    ProposalManagementInterface(proposalManagement).transferTokensFrom(msg.sender, address(this), loanParams.contractFee);

    
    if (loanParams.collateralAmount > 0) {
        loan.managementReturnCollateral();
    }

    
    openLoan[_loan] = false;
    loan.cleanUp();

    

    

    
    
}


function defaultOnLoan(address _loan) public {
    
    require(openLoan[_loan], "Invalid loan");
    LoanInterface loan = LoanInterface(_loan);
    LoanInterface.LoanParams memory loanParams = loan.getLoanParameters();
    require(msg.sender == loanParams.lender, "Only the lender may claim the loan's collateral");

    
    uint8 loanStatus = loan.refreshAndGetLoanStatus();
    require(loanStatus == 2, "Cannot claim collateral until the loan has reached maturity");

    
    if (loanParams.collateralAmount > 0) {
        loan.managementDefaultOnLoan();
    }

    
    openLoan[_loan] = false;
    loan.cleanUp();

}

function creditScore(address _loan, address _sender, address _lender) public {

     
    if (loanParams.effectiveDate + loanParams.duration < block.timestamp + 60) {

        
        uint256 borrowerScore = borrowerRatings[msg.sender];
        borrowerScore += (borrowerScore < 100) ? 50 : (300 - borrowerScore) / 4;

        
        
        borrowerRatings[msg.sender] = borrowerScore;
    }
    else {
         
    }

     
        
    if (loanParams.effectiveDate + loanParams.duration < block.timestamp + 60) {

        
        uint256 lenderScore = lenderRatings[loanParams.lender];
        lenderScore += (lenderScore < 100) ? 50 : (300 - lenderScore) / 4;

        
        
        lenderRatings[loanParams.lender] = lenderScore;
    }
    else {
        
    }
}



function cancelLoanAd(address _loan, address _sender) public {

    
    require(msg.sender == proposalManagement || msg.sender == address(this), "Only admin may cancel a loan ad");
    require(validLoanAd[_loan], "Loan request/offer is invalid, either because it does not exist or has already gone into effect");

    
    LoanInterface loanVar = LoanInterface(_loan);
    LoanInterface.LoanParams memory loanParams = loanVar.getLoanParameters();
    uint8 loanStatus = loanVar.getLoanStatus();

    
    loanVar.cleanUp();

    
    require(loanParams.borrower == address(0) || loanParams.lender == address(0), "INVALID LOAN STATE/PARAMS");
    if (loanParams.borrower == address(0)) {
        removeLoanOffer(_loan, loanParams.lender);
        
    } else {
        removeLoanRequest(_loan, loanParams.borrower);
        
    }

    
    
}


function removeLoanOffer(address _loanOffer, address _lender) private {
    
    userOfferCount[_lender]--;

    
    validLoanAd[_loanOffer] = false;

    
    uint idx = loanOffers.length;
    bool idxFound = false;
    while (true) {
        idx--;
        if (loanOffers[idx] == _loanOffer) {
            idxFound = true;
            break;
        }
    }

    
    if (idxFound) {
        while (idx < loanOffers.length - 1) {
            loanOffers[idx] = loanOffers[idx + 1];
            idx++;
        }
        loanOffers.pop();
    }
}


function removeLoanRequest(address _loanRequest, address _borrower) private {
    
    userRequestCount[_borrower]--;

    
    validLoanAd[_loanRequest] = false;

    
    uint idx = loanRequests.length;
    bool idxFound = false;
    while (idx > 0) {
        idx--;
        if (loanRequests[idx] == _loanRequest) {
            idxFound = true;
            break;
        }
    }

    
    if (idxFound) {
        while (idx < loanRequests.length - 1) {
            loanRequests[idx] = loanRequests[idx + 1];
            idx++;
        }
        loanRequests.pop();
    }
}


function getLoanRequests() public view returns (address[] memory) {
    return loanRequests;
}


function getLoanOffers() public view returns (address[] memory) {
    return loanOffers;
}


function getLoanParameters(address payable _loan)
public view returns (LoanInterface.LoanParams memory) {
    return LoanInterface(_loan).getLoanParameters();
}


function getLoanStatus(address _loan)
public view returns (uint8 loanStatus) {

    return LoanInterface(_loan).getLoanStatus();
}


function refreshAndGetLoanStatus(address _loan)
public returns (uint8 loanStatus) {
    return LoanInterface(_loan).refreshAndGetLoanStatus();
}
