contract SimpleSmartContractTest is SimpleSmartContract {
    function setup() public {
        currentPrices = 1234;
        priceIncrements[1] = 100;
        priceIncrements[2] = 110;
        priceIncrements[3] = 120;
    }
}
