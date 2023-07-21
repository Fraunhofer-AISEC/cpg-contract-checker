    
function setClaimConditions(ClaimCondition calldata _condition, bool _resetClaimEligibility) external override {
    if (!_canSetClaimConditions()) {
        revert("Not authorized");
    }

    bytes32 targetConditionId = conditionId;
    uint256 supplyClaimedAlready = claimCondition.supplyClaimed;

    if (_resetClaimEligibility) {
        supplyClaimedAlready = 0;
        targetConditionId = keccak256(abi.encodePacked(_dropMsgSender(), block.number));
    }

    if (supplyClaimedAlready > _condition.maxClaimableSupply) {
        revert("max supply claimed");
    }

    claimCondition = ClaimCondition({
        startTimestamp: _condition.startTimestamp,
        maxClaimableSupply: _condition.maxClaimableSupply,
        supplyClaimed: supplyClaimedAlready,
        quantityLimitPerWallet: _condition.quantityLimitPerWallet,
        merkleRoot: _condition.merkleRoot,
        pricePerToken: _condition.pricePerToken,
        currency: _condition.currency,
        metadata: _condition.metadata
    });
    conditionId = targetConditionId;
    

    emit ClaimConditionUpdated(_condition, _resetClaimEligibility);
}
