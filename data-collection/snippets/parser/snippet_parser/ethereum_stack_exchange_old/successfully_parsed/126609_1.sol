function calculateSomething() public view returns (uint256 something) {
    assembly {
        let a := 123456789
        let rate := _getCurrentRate()

        something := mul(a, rate)
    }
}
