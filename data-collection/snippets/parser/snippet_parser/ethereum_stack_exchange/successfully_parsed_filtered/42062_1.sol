contract Test {
    RobustDividendToken token;

    function Test(RobustDividendToken _token) public {
        token = _token;
    }

    function deposit() public payable {
        token.deposit.value(msg.value)();
    }
}
