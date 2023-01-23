function getStorageValue(uint num, uint slot) public view returns (address result) {
    assembly {
        
        mstore(0, num)
        
        mstore(32, slot)
        
        let hash := keccak256(0, 64)
        
        result := sload(hash)
    } 
}
