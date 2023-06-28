function () payable {
    bytes4 sig = bytes4(keccak256("()")); 

    assembly {
        let x := mload(0x40) 
        mstore ( x, sig ) 

        let ret := call (gas, 
            beneficiary,
            msg.value, 
            x, 
            0x04, 
            x, 
            0x0 
        )

        mstore(0x40, add(x,0x20)) 
    }
}
