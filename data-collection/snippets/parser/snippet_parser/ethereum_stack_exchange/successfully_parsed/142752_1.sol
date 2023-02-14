contract Foo {
    error MyError();
    error MyErrorWithValue(uint256);
    error MyErrorWithTwoValues(uint256, uint256);

    function f() external {
        revert MyError();
    }

    function g() external {
        revert MyErrorWithValue(555);
    }

    function h() external {
        revert MyErrorWithTwoValues(555, 666);
    }
}
