function encodeAmount(uint256 amount, bytes memory data) public pure returns(bytes memory encoded) {

    require(data.length == 68, "Expected 68 bytes of data");

        assembly {

            
            encoded := mload(0x40)

            
            mstore(encoded, add(mload(data), 32))

            
            for {let i:= 0} lt(i, mload(data)) {i := add(i, 32)} {
                mstore(add(add(encoded, 32), i), mload(add(add(data, 32), i)))
            }

            
            
            mstore(add(add(encoded, 32), 68), amount)

            
            mstore(0x40, add(encoded, add(mload(encoded), 32)))
        }

    return encoded;
}
