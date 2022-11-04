contract InnerContract {
    event Event(uint256);

    function func(uint256 val) external returns (uint256) {
        Event(val);
        return val;
    }
}
