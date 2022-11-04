function callX() public view returns(int) {
    var (a, , ) = setThreeValues();
    return a;
}

function callY() public view returns(uint) {
    var (, b, ) = setThreeValues();
    return b;
}

function callZ() public view returns(uint) {
    var (, , c) = setThreeValues();
    return c;
}
