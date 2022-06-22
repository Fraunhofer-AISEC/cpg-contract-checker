pragma solidity >0.4.23 <0.5.0;

import "./IParent.sol";

contract Child {
    IParent parent;

    function setParent(address a) public {
        parent = IParent(a);
    }

    function getValue() external view returns (int value) {
        return parent.getValue();
    }

    function getSender() external view returns (address value) {
        return parent.getSender();
    }
}
