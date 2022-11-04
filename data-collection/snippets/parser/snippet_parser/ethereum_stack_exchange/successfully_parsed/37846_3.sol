contract OuterContract {
    event Event(uint256);
    InnerContract pInnerContract;

    function func(uint256 val) external returns (uint256) {
        uint256 val2 = pInnerContract.func(val) + 1;
        Event(val2);
        return val2;
    }
}
