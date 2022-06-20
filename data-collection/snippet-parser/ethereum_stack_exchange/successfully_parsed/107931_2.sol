function dedupeKeys(string[] memory keyset) public pure returns(string[] memory) {
        require( keyset.length> 0, "dedupeKeys: keys array is empty");
        
        
        string[] memory uniqueKeys = new string[](keyset.length);
        uint uniqueKeysCount = 1;
        uniqueKeys[0]=keyset[0];
        for (uint i=1;i<uniqueKeys.length; i++) {
            if (!isMember(uniqueKeys, keyset[i])) {
                uniqueKeys[uniqueKeysCount]=keyset[i];
                uniqueKeysCount++;
            } 
        }
        
        return shrinkStringArray(uniqueKeys);
    }
    
  
    function isMember(string[] memory ar, string memory member) private pure returns(bool) {
        for(uint i = 0; i<ar.length; i++) {
            if (ar[i].equals(member)) {
                return true;
            }
        }
        return false;
    }
    
     function shrinkStringArray(string[] memory ar) public pure returns(string[] memory) {
        uint arLength = ar.length;
        string[] memory nonblank = new string[](arLength);
        uint nonBlankCount = 0;
        for(uint i; i<ar.length; i++) {
            if (!ar[i].isEmpty()) {
                nonblank[nonBlankCount]=ar[i];
                nonBlankCount++;
            }
        }
         
        string[] memory retval = new string[](nonBlankCount);
        for(uint i=0; i<nonBlankCount; i++) {
            retval[i]=nonblank[i];
        }
        return retval;
    }
    
