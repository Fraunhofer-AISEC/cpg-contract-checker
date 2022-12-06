bool test1;
bool test2;

function Test() public {
    test1 = false;
    test2 = false;
}

function test() public {
    test1 = true;
    _test2();
}

function _test2() internal {
    test2 = true;
    revert();
}

function getTest1() public view returns (bool) {
    return test1;
}

function getTest2() public view returns (bool) {
    return test2;
}
