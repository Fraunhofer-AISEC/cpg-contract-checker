contract A {
    uint256 public immutable X;

    constructor(uint256 _x) {
        X = _x;
    }
}

contract B is A(2) {}
