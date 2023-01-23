constructor(address _addressAliceCoin, address _addressBobCoin) payable {
    tokenA = ERC20(_addressAliceCoin);
    tokenB = ERC20(_addressBobCoin);
 }
