pragma solidity 0.4.24;

contract BytesToUint {

    function toUint(bytes _value) external pure returns (uint) {
        return toUint_(_value);
    }

    function toUint_(bytes memory _value) internal pure returns (uint) {
        uint256 r;

        for(uint256 i = 0; i < _value.length; i++) {
            r += uint256(_value[i]) << (i * 8);
        }
        return r;
    }
}
