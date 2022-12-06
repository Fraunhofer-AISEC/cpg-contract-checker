pragma solidity 0.8.12;

struct MigrateParams {
    address pair; 
    uint256 liquidityToMigrate; 
    uint8 percentageToMigrate; 
    address token0;
    address token1;
    uint24 fee;
    int24 tickLower;
    int24 tickUpper;
    uint256 amount0Min; 
    uint256 amount1Min; 
    address recipient;
    uint256 deadline;
    bool refundAsETH;
}

interface IToken {
    function migrate(MigrateParams calldata params) external;
}

contract Token {
    function migrate(MigrateParams calldata params) external {
        
        return;
    }
}

contract Contract{
    
    IToken public token;

    constructor(IToken _token){
        token = _token;
    }

    function callFunc() public {
        MigrateParams memory mig;
        mig.pair = address(this);
        mig.liquidityToMigrate = 40872475671826880538328523;
        mig.percentageToMigrate = 1;
        mig.token0 = 0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c;
        mig.token1 = 0xC3afDe95B6Eb9ba8553cDAea6645D45fB3a7FAF5;
        mig.fee = 500;
        mig.tickLower = 100;
        mig.tickUpper = 100;
        mig.amount0Min = 0;
        mig.amount1Min = 0;
        mig.recipient = address(this);
        mig.deadline = 8888888898993;
        mig.refundAsETH = true;

        token.migrate(mig);
    }

}
