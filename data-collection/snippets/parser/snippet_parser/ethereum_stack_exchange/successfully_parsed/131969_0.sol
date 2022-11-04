  function example() public pure returns (bytes32, string memory) {
        bytes32 myValue;

        assembly {
            
            mstore(mload(0x40), 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF)
        }

        string memory myString = "hello";

        assembly {
            myValue := mload(0x80)
        }

        
        
        return (myValue, myString);
    }
