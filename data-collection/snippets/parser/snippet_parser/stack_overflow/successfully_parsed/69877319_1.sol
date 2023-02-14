for (uint24 i = 1; i < limit; i++) {
    seed = uint(keccak256(abi.encodePacked(seed)));
    sorted[i] = uint32(seed);

    uint24 j = i;
    while (sorted[j - 1] > sorted[j]) {
        (sorted[j - 1], sorted[j]) = (sorted[j], sorted[j - 1]);
        j--;

        if (j == 0) {
            break;
        }
    }
}
