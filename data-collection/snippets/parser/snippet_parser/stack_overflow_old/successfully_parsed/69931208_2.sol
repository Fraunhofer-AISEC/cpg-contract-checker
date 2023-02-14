contract A {
    function X() external virtual returns (uint256) {
        return 1;
    }
}

contract B is A {
    uint256 public constant override X = 2;
}
