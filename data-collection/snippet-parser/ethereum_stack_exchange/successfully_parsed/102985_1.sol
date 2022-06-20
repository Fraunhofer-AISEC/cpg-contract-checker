ICurve cpool = ICurve(0x445FE580eF8d70FF569aB36e80c647af338db351);


function cputIn() external {
    uint256[3] memory coins;
    
    coins[0] = 1 ether;
    
    coins[1] = 0;
    
    coins[2] = 0;
    
    cpool.add_liquidity(coins, 1 ether, false);
}
