   function makeDecision(address person) external returns (string memory name, bool approved) {
       require(msg.sender == loanOfficer, "Only the loan officer can initiate a decision.");
       require(bytes(applicants[person].name).length != 0, "That person is not in the pool of applicants.");

       if (applicants[person].credScore > 650 && applicants[person].credAge > 5) {
          applicants[person].approved = true;
       }

       return (applicants[person].name, applicants[person].approved);
    }
