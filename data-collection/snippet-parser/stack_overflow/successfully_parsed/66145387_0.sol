pragma solidity >=0.4.25 <0.7.0;

contract Test {
    string public test;
    constructor(string memory _test) public {
        test = _test;
    }
}
