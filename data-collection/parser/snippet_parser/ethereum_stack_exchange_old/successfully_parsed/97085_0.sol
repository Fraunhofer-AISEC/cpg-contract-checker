contract Foo {
    function increment(uint256 x) external returns (uint256 result) {
        result = x + 1;
    }
    
    function increment_twice(uint256 x) external returns (uint256 result) {
        assembly {
            result := add(increment(x), 1)
        }
    }
}
