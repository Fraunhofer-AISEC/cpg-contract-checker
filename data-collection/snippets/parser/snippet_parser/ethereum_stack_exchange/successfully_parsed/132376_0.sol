contract contractA is ERC20, Ownable {
    constructor() ERC20("MyToken", "MTK") {
    }

    function mint(address account, uint256 amount) external onlyOwner {
        _mint(account, amount);
    }
}
