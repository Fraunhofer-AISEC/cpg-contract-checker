function hex2Base10 (bytes16 hexInput) public pure returns (uint output) {

    uint power10 = 1;

    uint128 input = uint128(hexInput);

    for(uint i; i < 31; ++i) {
        output = output + (input % 16) * power10;
        input = input / 16;
        power10 = power10 * 10;
    }

    output = output + (input % 16) * power10;

    return output;
}
