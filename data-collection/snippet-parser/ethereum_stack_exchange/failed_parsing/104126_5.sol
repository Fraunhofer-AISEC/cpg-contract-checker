function newTimeLockedWallet(address _owner, uint256 _unlockDate)
    payable
    public
    returns(TimeLockedWallet memory wallet)
{
...
}

event Created(TimeLockedWallet memory wallet, address from, address to, uint256 createdAt, uint256 unlockDate, uint256 amount);

