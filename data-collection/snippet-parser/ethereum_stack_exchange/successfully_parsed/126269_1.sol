
contract Foo { 
    
    bytes32 public constant location = keccak256("mystoragelocation");
    bytes32 public constant location2 = keccak256(abi.encodePacked(location));
    
    function storeString(string memory _string) public {
        bytes32 _location = location;
        bytes32 _location2 = location2;
        assembly {
            sstore(_location, mload(_string)) 
            sstore(_location2, mload(add(_string, 0x20))) 
        }
    }
function boo() public view returns (string memory p) {
        bytes32 _location = location;
        bytes32 _location2 = positiontwo;
        assembly {
            p := mload(0x40)
            mstore(p, sload(_location))
            mstore(add(p, 0x20), sload(_location2))
            
            mstore(0x40, add(p, 0x40))
        }
    }
}

