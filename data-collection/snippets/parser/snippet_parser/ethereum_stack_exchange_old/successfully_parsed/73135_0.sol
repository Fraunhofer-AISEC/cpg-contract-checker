function ShouldIMakeMyselfEligible(address) public view returns (bool) {
    if (_RestrictedFromDividend[address(msg.sender)]) {
        if (now >= (ClaimTime[address(msg.sender)] + 10 minutes)) {
            return true;
        } else {
            return false;
        }
     } else {
        return false;
    }
}
