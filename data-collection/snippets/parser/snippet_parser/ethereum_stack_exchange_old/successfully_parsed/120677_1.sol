constructor(uint256 amount1, uint256 amount2, uint256 total) ERC20("MyContract", "MYCT") {
    address addressOne = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;
    address addressTwo = 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db;
    _mint(owner(), total - amount1 - amount2);
    _mint(addressOne, amount1);
    _mint(addressTwo, amount2);
}
