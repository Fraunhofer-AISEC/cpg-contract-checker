    function mintTokens(string memory message) external
    {
        ClaimInfo memory claimInfo = decodeClaimInfo(bytes(message));
        _accountToTokenBalances[msg.sender][claimInfo.tokenId] = claimInfo.amount;
    }

    function decodeClaimInfo(bytes memory message) public pure returns (ClaimInfo memory)
    {
        return abi.decode(message, (ClaimInfo));
    }
