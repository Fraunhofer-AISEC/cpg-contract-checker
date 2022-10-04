function sendTokens(address pAddress, uint pAmount)
    external onlyVotingContract
{
    require(isAdmin(pAddress));
    transferWorker(address(this), pAddress, pAmount);
}
