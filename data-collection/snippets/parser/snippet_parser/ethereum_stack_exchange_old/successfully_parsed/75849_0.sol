contract SP {

    address BlockAddress;
    bytes32 _Mhash;

    function verifyHash_ASM(bytes32 _MHash) public returns (address payable Validator_address) {

        bytes4 sig = bytes4(keccak256("verifyHash(string)"));
        assembly {
            
            let ptr := mload(0x40)
            
            mstore(ptr,sig)
            
            mstore(add(ptr,0x04), _MHash)

            let result := call(
              15000, 
              sload(BlockAddress_slot),  
              0, 
              ptr, 
              0x20, 
              ptr,  
              0x20) 

            if eq(result, 0) {
                revert(0, 0)
            }

            Validator_address := mload(ptr) 
            mstore(0x40,add(ptr,0x24)) 

        }
        
        
    }
}