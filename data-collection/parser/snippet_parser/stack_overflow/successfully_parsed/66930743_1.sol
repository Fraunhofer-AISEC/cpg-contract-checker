
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
        require(initialBalance <= cap, "CommonERC20: cap exceeded"); 
        ERC20._mint(_msgSender(), initialBalance);
    }
}
