
function makeChild() internal returns (address addr) {
    assembly {
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        let solidity_free_mem_ptr := mload(0x40)
        mstore(solidity_free_mem_ptr, 0x00756eb3f879cb30fe243b4dfee438691c043318585733ff6000526016600af3)
        addr := create(0, add(solidity_free_mem_ptr, 1), 31)
    }
}
