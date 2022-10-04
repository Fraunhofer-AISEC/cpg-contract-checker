contract X {
    function foo() public pure virtual returns (string memory) {
        return "X";
    }
}

contract Y is X {
    function foo() public pure virtual override returns (string memory) {
        return "Y";
    }
}

contract Z is X, Y {
    function foo() public pure override(X, Y) returns (string memory) {
        return "Z";
    }
}

