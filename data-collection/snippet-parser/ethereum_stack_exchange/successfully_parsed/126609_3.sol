function calculateSomething() public view returns (uint256 something) {
    uint256 rate = _getCurrentRate();
    assembly {
        let a := 123456789
        something := mul(a, rate)
    }
}
