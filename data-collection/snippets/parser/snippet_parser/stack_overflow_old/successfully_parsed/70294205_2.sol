contract A {
    
    function getBValue() external returns (uint256) {
        uint256 BValue = B(address(0x123)).getValue();
        
        return BValue;
    }
}

contract B {
    
    function getValue() external returns (uint256) {
        return 1;
    }
}
