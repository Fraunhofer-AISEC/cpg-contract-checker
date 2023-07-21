    
    function selectWinner() external returns (bytes32 requestId) {
        require(msg.sender == deployer, "Only the deployer can select the winner");
        require(block.timestamp > endTime, "Ticket sale is still active");

        require(LINK.balanceOf(address(this)) >= fee, "Not enough LINK tokens in the contract");

        
        return requestRandomness(keyHash, fee);
    }

    
    function fulfillRandomness(bytes32 _requestId, uint256 _randomness) internal override {
        randomResult = _randomness;

        
        uint256 ticketCount = getTotalTicketCount();
        uint256 randomIndex = randomResult % ticketCount;
        address[] memory addresses = getAllParticipantAddresses();
        winner = addresses[randomIndex];

        emit WinnerSelected(winner);
    }

