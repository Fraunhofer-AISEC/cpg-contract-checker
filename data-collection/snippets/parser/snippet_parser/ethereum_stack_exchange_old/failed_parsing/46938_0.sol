function validPurchase(address beneficiary) internal view returns (bool) {
    bool isWhitelisted = whitelisted[beneficiary]; <----
    bool hasParticipated = participated[beneficiary];

    return isWhitelisted && !hasParticipated;
}
