pragma solidity >0.4.23 <0.5.0;

contract A {
    uint256 value;

    constructor(uint256 v) public {
        value = v;
    }

    function getValue() external view returns (uint256) {
        return value;
    }
}

contract B {
    A other;

    constructor(address a) public {
        other = A(a);
    }

    function getValueFromA() external view returns (uint256) {
        return other.getValue();
    }
}
