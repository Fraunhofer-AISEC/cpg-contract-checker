pragma solidity >=0.7.0 < 0.9.0;

contract LoanApplication {

     struct Applicant {
        bytes32 ssn;
    bool isTenant;
    
     }

     struct Loan {
        string loanID;
    uint applicantCount;
    uint256 rate;
    uint term;
      }

     mapping (address => Applicant) public applicants;

     Loan[] public loans;



     constructor(string[] memory loanIDs) {

       for (uint i=0; i < loanIDs.length; i++) {
            
            loans.push(Loan({
                loanID: loanIDs[i],
                applicantCount:0,
        rate: 10,
        term: 30
                }));
        }
     
     }

}
