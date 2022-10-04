address private constant _lendingPoolAddressesProvider = 0xd05e3E715d945B59290df0ae8eF85c1BdB684744;
address private constant USDC_POLY_ADDRESS = 0x2791Bca1f2de4661ED88A30C99A7a9449Aa84174;

ILendingPoolAddressesProvider addressesProvider = ILendingPoolAddressesProvider(_lendingPoolAddressesProvider);
ILendingPool lendingPool = ILendingPool(addressesProvider.getLendingPool());

ERC20 usdc = ERC20(USDC_POLY_ADDRESS);
uint16 referralCode = 0;

function deposit(uint256 amount, address to) external {
    require(amount > 0, "Amount needs to be greater than 0");

    
    usdc.transferFrom(msg.sender, address(this), amount);

    
    usdc.increaseAllowance(address(lendingPool), amount);

    
    lendingPool.deposit(address(usdc), amount, to, referralCode);
}

function withdraw(address to) external {
    lendingPool.withdraw(address(usdc), type(uint).max, to);
}
