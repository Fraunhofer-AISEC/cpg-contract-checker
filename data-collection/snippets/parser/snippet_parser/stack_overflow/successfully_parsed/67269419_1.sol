function foo() external {
    require(state == State.VALID || state == State.TERMINATED);
}
