
ERC20 public TOKEN = ERC20(0x8f3Cf7ad23Cd3CaDbD9735AFf958023239c6A063);

ILendingPoolAddressesProvider provider = ILendingPoolAddressesProvider(0xd05e3E715d945B59290df0ae8eF85c1BdB684744);
ILendingPool pool = ILendingPool(provider.getLendingPool());


function putInMoney() external {
    TOKEN.approve(address(pool), 1);
    pool.deposit(address(TOKEN), 1, msg.sender, 0);
}


function takeOut() external {
    pool.withdraw(address(TOKEN), 1, msg.sender);
}
