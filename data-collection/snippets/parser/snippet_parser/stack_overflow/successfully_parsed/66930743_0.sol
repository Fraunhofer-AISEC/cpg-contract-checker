contract SomeERC20 is ERC20Capped {

    constructor (
        string memory name,
        string memory symbol,
        uint256 cap,
        uint256 initialBalance
    )
        ERC20(name, symbol)
        ERC20Capped(cap)
    {
        _mint(_msgSender(), initialBalance);
    }
}
