
pragma solidity >=0.4.0 <0.9.0;


contract A  {
    string public b;

    constructor(string memory a) {
        b = a;
    }
}

contract B is A {
    constructor(string memory x) A(foo(x)) {

    }

    function foo(string memory z) internal pure returns (string memory) {
        return string(abi.encodePacked(z, "polo"));
    }
}
