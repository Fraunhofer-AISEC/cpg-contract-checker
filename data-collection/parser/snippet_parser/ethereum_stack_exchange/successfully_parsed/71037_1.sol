pragma solidity ^0.5.0;

contract B {
    mapping (uint256 => bool) _vals;

    function write(uint256 _a) public returns (bool) {
        _vals[_a] = true;
        return _vals[_a];
    }

    function read(uint256 _b) public view returns (bool) {
        return _vals[_b];
    }
}
