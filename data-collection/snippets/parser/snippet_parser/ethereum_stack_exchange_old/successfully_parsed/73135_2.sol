function ShouldIMakeMyselfEligible(address _addr) public view returns (bool) {
    if (
        _RestrictedFromDividend[_addr] &&
        now >= (ClaimTime[_addr] + 10 minutes)
    ) {
        return true;
    } else {
        return false;
    }
}
