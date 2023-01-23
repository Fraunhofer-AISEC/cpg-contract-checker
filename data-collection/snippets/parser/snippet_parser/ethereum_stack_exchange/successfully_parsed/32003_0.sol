function mergeBytes(bytes param1, bytes param2) returns (bytes) {

    bytes memory merged = new bytes(param1.length + param2.length);

    uint k = 0;
    for (uint i = 0; i < param1.length; i++) {
        merged[k] = param1[i];
        k++;
    }

    for (i = 0; i < param2.length; i++) {
        merged[k] = param2[i];
        k++;
    }
    return merged;
}
