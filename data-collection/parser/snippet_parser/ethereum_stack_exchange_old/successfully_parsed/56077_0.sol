function ToUint(bytes memory value) internal pure returns (uint) {
    uint r;
    for (uint i = value.length - 1; i >= 0; i--)
        r = (r << 8) + uint(value[i]);
    return r;
}
