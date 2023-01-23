pragma solidity ^0.4.24;

contract Test {
    mapping (uint128 => address[]) data;

    function addFeature() public {
        data[0] = new address[](0);
    }
}
