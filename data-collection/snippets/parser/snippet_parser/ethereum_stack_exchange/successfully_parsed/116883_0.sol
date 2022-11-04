contract StakeCoin is ERC20, Ownable {


uint256 public initialStakeCoinSupply = 1000000000000000000000000;



constructor(uint initialStakeCoinSupply) ERC20("Stake Coin Token", "STC") {
    _mint(owner(), initialStakeCoinSupply);
}


function mint(address to, uint256 value) public onlyOwner returns (bool) {
    _mint(to, value);
    return true;
}
}