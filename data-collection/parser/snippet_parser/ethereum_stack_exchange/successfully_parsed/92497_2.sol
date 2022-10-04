library L {
    function f() external {
        assembly {
            sstore(0, 1)
        }
    }
}
