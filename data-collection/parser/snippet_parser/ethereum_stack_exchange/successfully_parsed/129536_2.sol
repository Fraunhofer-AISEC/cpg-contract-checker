function encodeAmount(uint256 amount, bytes memory data) public pure returns(bytes memory) {

        require(data.length == 68, "Expected 68 bytes of data");

        assembly {
            
            
            mstore(add(add(data, 32), 68), amount)

            
            mstore(data, add(mload(data), 32))

            
            
            mstore(0x40, add(data, add(mload(data), 32)))
        }
        return data;
    }
