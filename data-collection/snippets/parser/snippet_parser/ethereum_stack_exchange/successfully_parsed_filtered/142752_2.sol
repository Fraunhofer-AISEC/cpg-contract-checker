function f() external {
    
    bytes4 errorSelector = this.MyError.selector;
    assembly {
        mstore(0, errorSelector)
        revert(0, 4)
    }
}

function f() external {
    
    bytes4 errorSelector = this.MyErrorWithValue.selector;
    assembly {
        mstore(0, errorSelector)
        mstore(4, 555)
        revert(0, 0x24)
    }
}

function h() external {
    
    bytes4 errorSelector = this.MyErrorWithTwoValues.selector;
    assembly {
        let ptr := mload(0x40)
        mstore(ptr, errorSelector)
        mstore(add(ptr, 0x04), 555)
        mstore(add(ptr, 0x24), 666)
        revert(ptr, 0x44)
    }
}
