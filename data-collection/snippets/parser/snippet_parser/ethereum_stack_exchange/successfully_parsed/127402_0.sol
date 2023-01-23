function claimToken(uint256[] memory requestTokenIds) public {
        require(isClaimActive, "Claim isn't active");
        uint256 supply = totalSupply();

        uint256[] memory ownedTokens = fc.tokensOfOwner(msg.sender);
        uint256[] memory unclaimedTokens = new uint256[](ownedTokens.length);
        uint256 unclaimedTokensLastIndex = 0;

        for(uint i = 0; i < requestTokenIds.length; i++) {
            if (!claimed[requestTokenIds[i]]) {
                for (uint256 k = 0; k < ownedTokens.length; k++) { 
                    if (ownedTokens[k] == requestTokenIds[i]) {
                        unclaimedTokens[unclaimedTokensLastIndex] = ownedTokens[k];
                        unclaimedTokensLastIndex++;
                        break;
                    } 
                }
            }
        }

        require(unclaimedTokensLastIndex > 0, "No tokens to claim");

        if (unclaimedTokensLastIndex > 50) {
            unclaimedTokensLastIndex = 50;
        }

        for (uint256 i = 0; i < unclaimedTokensLastIndex; i++) {
            if(!claimed[unclaimedTokens[i]]) { 
                claimed[unclaimedTokens[i]] = true;
                _safeMint( msg.sender, supply + i );
            }
        }
    }
