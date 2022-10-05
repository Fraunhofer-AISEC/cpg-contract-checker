contract Test {
    uint256 public a = 10;
    
    uint256 public b = 1;
    
    function aPure() public pure returns(uint256) {
        return 10;
    }
    
    function aFunc() public {
        b = a;
    }
    
    function aPureFunc() public {
        b = aPure();
    }
}
