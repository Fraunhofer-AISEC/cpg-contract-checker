struct LoanParams {
    address lender;
    address borrower;
    bool initiatorVerified;
    uint256 principalAmount;
    uint256 paybackAmount;
    uint256 contractFee;
    string purpose;
    address collateralToken;
    uint256 collateralAmount;
    uint256 duration;
    uint256 effectiveDate;
}

function managementAcceptLoanOffer(address) external;

function managementAcceptLoanRequest(address) external;

function managementReturnCollateral() external;

function managementDefaultOnLoan() external;

function cleanUp() external;

function borrower() external view returns (address);

function lender() external view returns (address);

function getLoanParameters() external view returns (LoanParams memory);

function getLoanStatus() external view returns (uint8);

function refreshAndGetLoanStatus() external returns (uint8);
