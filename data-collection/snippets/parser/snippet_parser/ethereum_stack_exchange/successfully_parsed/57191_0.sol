contract Test {
    uint counter = 0;
    function A() public returns (uint256) {
        counter++;
        return counter;
    }

    function B() public view returns (uint256) {
        return A();
    }
}
