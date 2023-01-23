contract test {
    bool isTrue = true;
    function foo() public {
        if (isTrue) {
            emit Event(..)
        } else {
            return;
        }
    }
    function changeToFalse() public {
        isTrue = false;
    }
}
