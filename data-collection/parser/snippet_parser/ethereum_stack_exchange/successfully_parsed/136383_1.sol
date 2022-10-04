function holderClaim() public nonReentrant {
        require(_contract.balanceOf(msg.sender) > 0, "Address does not own any tokens");
        require(CONTRACT_STATUS == ContractStatus.holderClaim, "Claim is not active.");

        uint256 numTokensClaimed;
        uint256[] memory ownedIds = getOwnedIds(msg.sender);
         
        for (uint256 i = 0; i < ownedIds.length; i++) {
            if (!isClaimed(ownedIds[i])) {
                _setClaimed(ownedIds[i]);
                numTokensClaimed++;
            }
        }

        if(numTokensClaimed == 0) {
            revert("No claimables");
        }

        _safeMint(msg.sender, numTokensClaimed);
    }
