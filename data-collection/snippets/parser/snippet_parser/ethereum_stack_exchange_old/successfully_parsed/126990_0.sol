function jobAssignment(uint256 _jobID) external {
        
        Job memory job = JobList[_jobID];
        require(
            job.jobStatus == JobStatus.PENDING,
            "This job is already accepted by a freelancer"
        );
        
        job.freelancer = msg.sender;
        
        job.jobStatus = JobStatus.IN_PROGRESS;
        
        emit JobAssigned(_jobID, msg.sender);
    }
