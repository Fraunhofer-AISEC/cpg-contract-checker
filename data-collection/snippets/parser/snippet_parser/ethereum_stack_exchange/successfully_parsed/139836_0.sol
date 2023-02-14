    
function asmbl() public view returns (uint8 b) {
    assembly {
        let c := add(27, 16)
        mstore(0x80, c)
        { let d := add(sload(c), 255) b := d }
        b := add(b, c) }
    }
