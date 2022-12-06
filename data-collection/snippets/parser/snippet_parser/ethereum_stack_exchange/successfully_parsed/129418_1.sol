

pragma solidity 0.8.14;

contract A {
    modifier modified() {
        
        _;
        
    }
    function _unmodifiedTest3() internal virtual {
        
    }
    function test3() external modified {
        _unmodifiedTest3();
    }
}

contract B is A {
    function _unmodifiedTest3() internal override {
        super._unmodifiedTest3();
        
    }
}
