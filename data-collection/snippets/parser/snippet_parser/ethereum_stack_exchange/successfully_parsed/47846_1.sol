contract TestGasDebug is GasDebug {

    uint256 store;

    function test_1(uint256 _a) 
        debugGasUsed
    {
        store = _a;
    }
}
