contract MyToken is ERC20, Ownable {
    uint256 public presetValue = 1;
    uint256 public constructorValue;

    constructor() ERC20("MyToken", "MTKN") {
        constructorValue = 2;
    }
}
