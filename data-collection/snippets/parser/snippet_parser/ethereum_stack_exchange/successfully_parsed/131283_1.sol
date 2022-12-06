function extractCalldata(bytes memory calldataWithSelector) internal pure returns (bytes memory) {
        bytes memory calldataWithoutSelector;

        require(calldataWithSelector.length >= 4);

        assembly {
            let totalLength := mload(calldataWithSelector)
            let targetLength := sub(totalLength, 4)
            calldataWithoutSelector := mload(0x40)
            
            
            mstore(calldataWithoutSelector, targetLength)

            
            mstore(0x40, add(0x20, targetLength))

            
            mstore(add(calldataWithoutSelector, 0x20), shl(0x20, mload(add(calldataWithSelector, 0x20))))

            
            for { let i := 0x1C } lt(i, targetLength) { i := add(i, 0x20) } {
                mstore(add(add(calldataWithoutSelector, 0x20), i), mload(add(add(calldataWithSelector, 0x20), add(i, 0x04))))
            }
        }

        return calldataWithoutSelector;
    }
