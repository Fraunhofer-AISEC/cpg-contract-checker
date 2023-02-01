contract MyContract {
    event LogString(string memory _value);
    event LogAddress(address _value);

    function foo() external {
        emit LogString("myString");
        emit LogAddress(address(0x123));
    }
}
