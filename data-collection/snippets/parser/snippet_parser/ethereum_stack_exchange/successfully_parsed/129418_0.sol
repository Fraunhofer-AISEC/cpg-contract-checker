

pragma solidity 0.8.14;

contract A {
    modifier modified() {
        revert("Modified");
        
        _;
        
    }

    function test1() public virtual modified {
        
    }
    function test2() public virtual modified {
        
    }
}

contract B is A {
    function test1() public override {
        
    }
    function test2() public override {
        super.test2();
        
    }
}
