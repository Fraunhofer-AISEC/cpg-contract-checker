contract Base {
    uint256 public x;

    function foo(uint256 a) public {
        x = 1000 + a;
    }

    function bar() public view returns (uint256) {
        return x;
    }
}

contract Derived is Base {
    function bar() public view returns (uint256) {
        return 123 + super.bar();
    }
}
