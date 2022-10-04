
pragma solidity ^0.8.0;

    contract Foo { 
    
    bytes32 public constant length = keccak256("mystoragelocation");
    bytes32 public constant data = keccak256(abi.encodePacked(length));

    function storeString(string memory _string) public {
        bytes32 _length = length;
        bytes32 _data = data;

        assembly {
            let stringLength := mload(_string)

            switch gt(stringLength, 0x19)

            
            
            
            
            
            case 0x00 {
                sstore(_length, or(mload(add(_string, 0x20)), mul(stringLength, 2)))
            }

            
            
            
            
            
            
            
            case 0x01 {
                 
                sstore(_length, add(mul(stringLength, 2), 1))

                
                for {let i:= 0} lt(mul(i, 0x20), stringLength) {i := add(i, 0x01)} {
                    sstore(add(_data, i), mload(add(_string, mul(add(i, 1), 0x20))))
                }
            }
        }

    }

    function readString() public view returns (string memory returnBuffer) {
        bytes32 _length = length;
        bytes32 _data = data;

        assembly {
            let stringLength := sload(_length)

            
            
            
            
            switch and(stringLength, 0x01)

            
            case 0x00 {
                let decodedStringLength := div(and(stringLength, 0xFF), 2)

                
                mstore(returnBuffer, decodedStringLength)
                mstore(add(returnBuffer, 0x20), and(stringLength, not(0xFF)))
                mstore(0x40, add(returnBuffer, 0x40))
            }

            
            case 0x01 {
                let decodedStringLength := div(stringLength, 2)
                let i := 0

                mstore(returnBuffer, decodedStringLength)
                
                
                for {} lt(mul(i, 0x20), decodedStringLength) {i := add(i, 0x01)} {
                    mstore(add(add(returnBuffer, 0x20), mul(i, 0x20)), sload(add(_data, i)))
                }

                mstore(0x40, add(returnBuffer, add(0x20, mul(i, 0x20))))
            }
        }
    }
}
