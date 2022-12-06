function claimsProcessed() public adminOnly view returns (uint256)
{
    return claimCount;
}

modifier adminOnly() {
    require (
        msg.sender == admin, "Security Violation - You are not an admin"
    );
    _;
}
