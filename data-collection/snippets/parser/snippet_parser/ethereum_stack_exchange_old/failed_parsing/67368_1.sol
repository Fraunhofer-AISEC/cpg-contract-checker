contract SimpleToken is ERC20Detailed, ERC20Capped {
    uint8 public constant DECIMALS = 18;

    constructor (uint256 cap)
        ERC20Detailed("SimpleToken", "SIM", DECIMALS)
        ERC20Capped(cap)
        public {
           ...
    }
}
