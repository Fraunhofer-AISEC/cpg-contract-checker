function _removeFlag(address sender) internal {
    
    if (mapping1[sender] > 0) {
       mapping1[sender] = 0;
    }
}        
