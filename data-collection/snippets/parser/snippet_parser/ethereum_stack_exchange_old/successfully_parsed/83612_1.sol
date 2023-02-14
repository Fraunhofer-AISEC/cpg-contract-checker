    function pay() external payable requireIsOperational {
        require(msg.sender != address(0), "Not a valid address");
        require(
            insurance[msg.sender].isValue == true,
            "The caller is not insured"
        );
        require(
            pendingCredit[msg.sender] != 0,
            "The pending credit amount is 0"
        );
        uint256 payout = pendingCredit[msg.sender];
        pendingCredit[msg.sender] = 0;
        msg.sender.transfer(payout);
        
        emit InsurancePayoutPaid(msg.sender, payout);
    }
