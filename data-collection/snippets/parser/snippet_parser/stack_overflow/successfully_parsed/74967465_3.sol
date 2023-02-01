function validateAdditionalCalldata() pure external returns (bool, address) {
    bytes memory additionalCalldataMemory = hex"0000000000000000000000000000000000000000000000000000000000000001";
    bool decoded1 = abi.decode(additionalCalldataMemory, (bool));
    address decoded2 = abi.decode(additionalCalldataMemory, (address));

    return (decoded1, decoded2);
}
