function sendLumpSumIntoContract(ISuperToken token, uint256 amount) external 
        token.transferFrom(msg.sender, address(this), amount);
    }
