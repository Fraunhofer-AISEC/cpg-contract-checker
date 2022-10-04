    function approve(address delegate, uint256 numTokens) public override returns (bool) {

        allowed[msg.sender][delegate] = numTokens;

        emit Approval(msg.sender, delegate, numTokens);

        return true;

    }
