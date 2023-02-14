function subSha256(bytes memory data, uint256 offset, uint256 length) public view returns(bytes32) {
    bytes32[1] memory result;
    assembly {
        pop(staticcall(gas, 0x02, add(add(data, 32), offset), length, result, 32))
    }
    return result[0];
}
