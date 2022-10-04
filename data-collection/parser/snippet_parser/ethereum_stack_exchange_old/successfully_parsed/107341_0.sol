function contributeToPot(uint256 _potIdx) public payable returns (bool) {
        require(msg.value > 0, "The amount must be more than 0");
        require(pots[_potIdx].status == PotStatus.RUNNING, "The pot is closed, you cannot add more funds");

        
        if (contributionAmountForAddress[_potIdx][msg.sender] > 0) {
            contributionAmountForAddress[_potIdx][msg.sender] = contributionAmountForAddress[_potIdx][msg.sender] + msg.value;
        } else {
            contributionAmountForAddress[_potIdx][msg.sender] = msg.value;
        }

        return true;
    }
