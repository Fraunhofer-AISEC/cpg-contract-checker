function extractRevertReason (bytes memory revertData)
internal pure returns (string memory reason) {
    uint l = revertData.length;
    if (l < 68) return "";
    uint t;
    assembly {
        revertData := add (revertData, 4)
        t := mload (revertData) 
        mstore (revertData, sub (l, 4)) 
    }
    reason = abi.decode (revertData, (string));
    assembly {
        mstore (revertData, t) 
    }
}
