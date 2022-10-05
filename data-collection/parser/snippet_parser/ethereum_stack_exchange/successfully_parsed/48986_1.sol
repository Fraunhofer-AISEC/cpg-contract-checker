
function deploy(bytes _code1, bytes _code2) public {
    address tokenAddress;
    assembly {
        tokenAddress := create(0, add(_code, 0x20), mload(_code))

        
        let m := mload(0x40)
        mstore(add(m, 20), xor(0x140000000000000000000000000000000000000000, tokenAddress))
        mstore(0x40, add(m, 52))
        let b := m

        
        let appended := add(_code2, b)

        saleAddress := create(0, add(appended, 0x20), mload(_code2))
        if iszero(extcodesize(saleAddress)) { revert(0, 0) }
    }
}
