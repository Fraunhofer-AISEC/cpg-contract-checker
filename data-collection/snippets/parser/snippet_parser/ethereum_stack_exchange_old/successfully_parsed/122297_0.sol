
pragma solidity 0.8.7;

contract A {
    mapping (address => uint256) public foo;

    function bar(address k, uint256 v) public {
        foo[k] = v;
    }
}


contract B {
    A public a;

    constructor(A _a) {
        a = _a;
    }
    function read(address k) public view returns (uint256) {
        uint256 x = a.foo(k);
        return x + 1234;
    }
}
