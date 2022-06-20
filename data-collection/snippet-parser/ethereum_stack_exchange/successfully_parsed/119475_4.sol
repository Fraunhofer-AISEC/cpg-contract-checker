contract DerivedFlattened {
    uint256 public x;

    function foo(uint256 a) public {
        x = 1000 + a;
    }

    function Base_bar() internal view returns (uint256) {
        return x;
    }

    function bar() public view returns (uint256) {
        return 123 + Base_bar();
    }
}

