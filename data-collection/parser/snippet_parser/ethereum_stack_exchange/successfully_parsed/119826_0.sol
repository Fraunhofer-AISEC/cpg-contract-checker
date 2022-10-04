function deposit(address user, bytes calldata depositData)
    external
    override
    only(DEPOSITOR_ROLE)
{
    uint256 amount = abi.decode(depositData, (uint256));
    _mint(user, amount);
}
