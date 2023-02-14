pragma solidity >0.4.23 <0.5.0;

import "./IParent.sol";

contract Parent is IParent {
    int value;

    function setValue(int v) public {
        value = v;
    }

    function getValue() external view returns (int) {
        return value;
    }

    function getSender() external view returns (address) {
        return msg.sender;
    }
}
