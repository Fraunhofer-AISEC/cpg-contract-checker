function transfer(address to, uint256 value)
    external
    override
    validRecipient(to)
    initialDistributionLock
    returns (bool)
{
    _transferFrom(msg.sender, to, value);
    return true;
}
