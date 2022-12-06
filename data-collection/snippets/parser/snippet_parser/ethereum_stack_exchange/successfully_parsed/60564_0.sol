function hardcodedExample() public pure returns(bool) {
    uint256[4] memory first = [uint256(2), 4, 6, 8];
    uint256[4] memory second = [uint256(4), 2, 5, 7];

    
    for (uint256 ii = 0; ii < first.length; ii++) {
        
        for (uint256 jj = 0; jj < second.length; jj++) {
            
            if (first[ii] == second[jj]) {
                
                break; 

            
            } else {
                
                
                
                if (jj == second.length - 1) return false;

                
                continue;
            }
        }
    }

    
    
    
    return true;
}
