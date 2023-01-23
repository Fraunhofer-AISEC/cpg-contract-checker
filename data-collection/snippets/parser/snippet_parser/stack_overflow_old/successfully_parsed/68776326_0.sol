
pragma solidity >=0.7.0 <0.9.0;

import "./Bridge.sol";

contract Federation {
    function getBridge() private pure returns (Bridge) {
        return Bridge(address(0x01000006));
    }
    function getFederationSize() private view returns ( int256 ) {
        return getBridge().getFederationSize();
    }
    function getFederatorPublicKeyOfType ( int256 index, string memory atype ) private view returns ( bytes memory ) {
        return getBridge().getFederatorPublicKeyOfType(index, atype);
    }
    function getFederatorKeys() public view returns( bytes[] memory ) {
        int256 fedSize = getFederationSize();
        bytes[] memory keys = new bytes[](uint(fedSize));
        for (int256 i = 0; i < fedSize; i += 1) {
            keys[uint(i)] = getFederatorPublicKeyOfType(i, 'rsk');
        }
        return keys;
    }
}
