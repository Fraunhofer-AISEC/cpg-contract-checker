
pragma solidity ^0.8.0;

library BytesShift {
    function shiftLeft(bytes memory x, uint256 n)
        public
        pure
        returns (bytes memory)
    {
        bytes memory tmp;
        assembly {
            tmp := shl(n, x)
        }
        return tmp;
    }
}
