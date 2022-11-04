(bool success, bytes memory result) = address(_impl).delegatecall(signature);
if (success == false) {
    assembly {
        let ptr := mload(0x40)
        let size := returndatasize
        returndatacopy(ptr, 0, size)
        revert(ptr, size)
    }
}
return result;
