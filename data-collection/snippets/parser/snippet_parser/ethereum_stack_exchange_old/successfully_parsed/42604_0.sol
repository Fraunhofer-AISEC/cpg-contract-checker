contract A {
    uint256 x;
    uint256 y;
    uint256 z;
    uint256 w;
    function getVars() external constant returns (uint256, uint256, uint256, uint256) {
        return (x, y, z, w);
    }
}

contract B {
    A private a;

    function func1() external {
        var (x, y, z, w) = a.getVars();
        
    }

    function func2() external {
        var (x, y, z, w) = a.getVars();
        
    }
}
