bytes32 key = bytes32(0);
bytes memory val = abi.encodePacked(bytes32(0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF));
bytes32 result;
assembly {
    sstore(key, val)
    result := sload(key)
}


result;
