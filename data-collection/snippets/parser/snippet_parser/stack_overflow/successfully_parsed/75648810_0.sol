function ripemd160(bytes memory input) internal pure returns (bytes20) {
    bytes20 hash;
    assembly {
        hash := ripemd160(input, 32)
    }
    return hash;
}

function sha256(bytes memory input) internal pure returns (bytes32) {
    bytes32 hash;
    assembly {
        hash := sha256(input, 32)
    }
    return hash;
}

function base58encode(bytes memory input) internal pure returns (string memory) {
    uint8[] memory digits = new uint8[](58);
    digits[0] = uint8(bytes1("1"));
    digits[1] = uint8(bytes1("2"));
    digits[2] = uint8(bytes1("3"));
    digits[3] = uint8(bytes1("4"));
    digits[4] = uint8(bytes1("5"));
    digits[5] = uint8(bytes1("6"));
    digits[6] = uint8(bytes1("7"));
    digits[7] = uint8(bytes1("8"));
    digits[8] = uint8(bytes1("9"));
    digits[9] = uint8(bytes1("A"));
    digits[10] = uint8(bytes1("B"));
    digits[11] = uint8(bytes1("C"));
    digits[12] = uint8(bytes1("D"));
    digits[13] = uint8(bytes1("E"));
    digits[14] = uint8(bytes1("F"));
    digits[15] = uint8(bytes1("G"));
    digits[16] = uint8(bytes1("H"));
    digits[17] = uint8(bytes1("J"));
    digits[18] = uint8(bytes1("K"));
    digits[19] = uint8(bytes1("L"));
    digits[20] = uint8(bytes1("M"));
    digits[21] = uint8(bytes1("N"));
    digits[22] = uint8(bytes1("P"));
    digits[23] = uint8(bytes1("Q"));
    digits[24] = uint8(bytes1("R"));
    digits[25] = uint8(bytes1("S"));
    digits[26] = uint8(bytes1("T"));
    digits[27] = uint8(bytes1("U"));
    digits[28] = uint8(bytes1("V"));
    digits[29] = uint8(bytes1("W"));
    digits[30] = uint8(bytes1("X"));
    digits[31] = uint8(bytes1("Y"));
    digits[32] = uint8(bytes1("Z"));
    digits[33] = uint8(bytes1("a"));
    digits[34] = uint8(bytes1("b"));
    digits[35] = uint8(bytes1("c"));
    digits[36] = uint8(bytes1("d"));
    digits[37] = uint8(bytes1("e"));
    digits[38] = uint8(bytes1("f"));
    digits[39] = uint8(bytes1("g"));
    digits[40] = uint8(bytes1("h"));
    digits[41] = uint8(bytes1("i"));
    digits[42] = uint8(bytes1("j"));
    digits[43] = uint8(bytes1("k"));
    digits[44] = uint8(bytes1("m"));
    digits[45] = uint8(bytes1("n"));
    digits[46] = uint8(bytes1("o"));
    digits[47] = uint8(bytes1("p"));
    digits[48] = uint8(bytes1("q"));
    digits[49] = uint8(bytes1("r"));
    digits[50] = uint8(bytes1("s"));
    digits[51] = uint8(bytes1("t"));
    digits[52] = uint8(bytes1("u"));
    digits[53] = uint8(bytes1("v"));
    digits[54] = uint8(bytes1("w"));
    digits[55] = uint8(bytes1("x"));
    digits[56] = uint8(bytes1("y"));
    digits[57] = uint8(bytes1("z"));

    uint8[] memory addressDigits = new uint8[](50);
    uint256 dividend = bytesToUint(input);
    uint256 remainder;
    uint256 quotient;
    uint256 digitIndex = 49;
    while (dividend > 0) {
        (quotient, remainder) = divmod(dividend, 58);
        addressDigits[digitIndex] = digits[uint256(remainder)];
        digitIndex--;
        dividend = quotient;
    }
    for (uint256 i = 0; i < input.length && input[i] == 0; i++) {
        addressDigits[digitIndex] = digits[0];
        digitIndex--;
    }
    return string(abi.encodePacked(bytes1("1"), toBytes(addressDigits)));
}

function bytesToUint(bytes memory b) internal pure returns (uint256) {
    uint256 number;
    for (uint256 i = 0; i < b.length; i++) {
        number = number + uint256(uint8(b[i])) * (2 ** (8 * (b.length - (i + 1))));
    }
    return number;
}

function toBytes(uint8[] memory data) internal pure returns (bytes memory) {
    bytes memory result = new bytes(data.length);
    for (uint256 i = 0; i < data.length; i++) {
        result[i] = bytes1(data[i]);
    }
    return result;
}

function divmod(uint256 a, uint256 b) internal pure returns (uint256, uint256) {
    return (a / b, a % b);
}
