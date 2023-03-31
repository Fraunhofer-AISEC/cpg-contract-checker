
pragma solidity 0.8.19;

contract Foo {
    uint256 immutable _VALUE;

    constructor(uint256 _initialValue) {
        _VALUE = _initialValue;
    }

    function VALUE() external view virtual returns (uint256) {
        return _VALUE;
    }
}

contract GodModeFoo is Foo {
    uint256 private __godMode_value;
    bool private __use_godMode_value;

    constructor(uint256 _initalValue) Foo(_initalValue) {}

    function __set_value(uint256 _value) external {
        __use_godMode_value = true;
        __godMode_value = _value;
    }

    function VALUE() external view override(Foo) returns (uint256) {
        if (__use_godMode_value) {
            return __godMode_value;
        }
        return _VALUE;
    }
}
