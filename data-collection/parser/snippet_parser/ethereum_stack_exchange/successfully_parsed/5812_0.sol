contract DepositCounter {
    uint deposits = 0;
    function() {
        deposits++;
    }
}
