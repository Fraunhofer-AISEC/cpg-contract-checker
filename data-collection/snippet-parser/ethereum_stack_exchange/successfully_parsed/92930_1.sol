contract Foo {
    uint256 public x;
    
    constructor(uint256 y) public {
        setUp(y);
    }
    
    function setUp(uint256 w) public {
        x = w;
    }
}
