pragma solidity ^0.5.0;

import "@openzeppelin/upgrades/contracts/Initializable.sol";

contract Counter is Initializable {
    uint256 public value;

    function initialize(uint256 initialValue) initializer public {
        value = initialValue;
    }

    function increase() public {
        value++;
    }
}
