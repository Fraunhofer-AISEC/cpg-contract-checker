contract WalkDogToken is ERC20, ERC20Burnable, Ownable {
    constructor() ERC20("WalkDogToken", "WDT") {}

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function decimals() public view virtual override returns (uint8) {
        return 8;
    }

    receive() external payable {}
}
