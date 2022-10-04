pragma solidity >=0.4.0;

contract Constants {
    uint256 public constant MY_CONSTANT = 6174;
}

contract Foo is Constants {
    function foo() pure public returns (uint256) {
        return MY_CONSTANT;
    }
}

contract Bar is Constants {
    function bar() pure public returns (uint256) {
        return MY_CONSTANT;
    }
}
