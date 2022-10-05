contract ArrayTest {
    function test() internal pure returns (address[] memory) {
        address[] memory a = new address[](1);
        a[0] = address(0);
        a = push(a, address(1));
        a = push(a, address(2));
        a = push(a, address(3));
        a = push(a, address(4));
        a = push(a, address(5));
        return a;
    }

    function push(address[] memory a, address addressToPush)
        internal
        pure
        returns (address[] memory)
    {
        
        address[] memory b = new address[](a.length + 1);
        
        for (uint256 i = 0; i < a.length; i++) {
            b[i] = a[i];
        }
        
        b[b.length - 1] = addressToPush;
        
        return b;
    }
}
