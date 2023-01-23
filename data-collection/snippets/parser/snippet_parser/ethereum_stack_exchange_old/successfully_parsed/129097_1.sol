function foo() public override(A, B) returns (uint256) {
    return B.foo();
}
