contract XYZToken is ERC20, ERC20Burnable, Ownable, {
    constructor() ERC20("XYZToken", "XYZ") ERC20Permit("XYZToken") {}

    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }
...
