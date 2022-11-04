contract LoanApplication {

  struct Applicant {
    bytes32 ssn;
    bool hasApplied;

  }

  struct Loan {
    string loanID;
    uint applicantCount;
    uint256 rate;
    uint term;
  }

 mapping (address => Applicant) public applicants;

 Loan[] public loans;

 address public loansAdmin;

 constructor(string[] memory loanIDs) {

    loansAdmin = msg.sender;

   for (uint i=0; i < loanIDs.length; i++) {
        
        loans.push(Loan({
            loanID: loanIDs[i],
            applicantCount:0,
            rate: 10,
            term: 30
            }));
    }
 
 }

 function receiveApplication(address applicant) external {
    require(
        msg.sender == loansAdmin, "Only administrator can receive application"
        );

     require(
        !applicants[applicant].hasApplied,
        "Applicant previously applied"
        );

    applicants[applicant].hasApplied = true;

 
   }

}
