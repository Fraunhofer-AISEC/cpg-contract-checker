contract test {
    function testfunc(uint _number) external pure returns (bool) {
       return _number >= 0;
    }
}
