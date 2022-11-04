bytes memory toBeConvert = "xxxxx";
bytes32 converted;

assembly {
    encoded := mload(add(result, 32))
}
