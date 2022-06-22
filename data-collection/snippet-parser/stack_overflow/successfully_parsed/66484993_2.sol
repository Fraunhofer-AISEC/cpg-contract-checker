function startProposalRegistration() public onlyOwner   {
        status = WorkflowStatus.ProposalsRegistrationStarted;
        emit ProposalsRegistrationStarted();
    }
