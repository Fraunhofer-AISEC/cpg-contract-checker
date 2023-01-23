function receiveRevealedAPIJobResult(
        uint256[] memory dataValues,
        uint256 rand,
        uint256 jobId
    ) public {
        
            APINodeJobResponse memory newJobResponse;
            newJobResponse.jobId = jobId;
            for (uint i = 0; i < dataValues.length; i++) {
               newJobResponse.responseValue[i]= dataValues[i];
           }
            jobResponses[msg.sender] = newJobResponse;
    }
