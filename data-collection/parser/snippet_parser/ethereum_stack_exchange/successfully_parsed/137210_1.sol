contract EnergyVoting is ERC20, Ownable {
constructor() ERC20("EnergyVoting", "ENGV") {}

function mint(address to, uint256 amount) public {
    _mint(to, amount);
}
}