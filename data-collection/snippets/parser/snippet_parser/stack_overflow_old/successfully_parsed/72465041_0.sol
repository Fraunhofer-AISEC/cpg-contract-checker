
pragma solidity 0.8.13;

contract Sample {

    function getValue(bytes memory a) external pure returns(uint256 value) {
        assembly {
            value := mload(add(a, 0x20))
        }
    }
}
