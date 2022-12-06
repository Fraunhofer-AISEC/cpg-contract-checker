    function updateRequest(
      address employee, 
      uint256 requestIndex, 
      Requests memory bar
    ) external {
      require(msg.sender == employee || msg.sender == manager, "NOT_ALLOWED")

      Rqst[employee][requestIndex].status = bar.status;
      Rqst[employee][requestIndex].amount = bar.amount;
      Rqst[employee][requestIndex].description = bar.description;

    }

  
