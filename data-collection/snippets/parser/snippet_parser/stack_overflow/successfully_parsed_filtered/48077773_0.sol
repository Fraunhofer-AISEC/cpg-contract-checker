contract GasUsage {
    uint val;

    function someFunc() public returns (bool) {
        require(true);

        delete val;
    }
}
