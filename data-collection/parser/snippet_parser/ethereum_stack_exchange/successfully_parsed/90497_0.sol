pragma solidity 0.5.16;

contract Test {
    function encode(uint256 a, address b, address c, uint8 d) public view returns(bytes memory) {
        bytes memory data = new bytes(80);
        
        assembly {
            mstore(
                add(
                    data,
                    32
                ),
                a
            )
            
            mstore(
                add(
                    data,
                    64
                ),
                shl(96, b)
            )
            
            mstore(
                add(
                    data,
                    84
                ),
                shl(96, c)
            )
            
            mstore(
                add(
                    data,
                    104
                ),
                shl(248, d)
            )
        }
        
        return data;
    }
    
    function decode(bytes memory data) public view returns(uint256 a, address b, address c, uint8 d) {
        assembly {
            a := mload(
                add(
                    data,
                    32
                )
            )
            
            b := mload(
                add(
                    data,
                    52
                )
            )
            
            c := mload(
                add(
                    data,
                    72
                )
            )
            
            d := mload(
                add(
                    data,
                    73
                )
            )
        }
    }
}
