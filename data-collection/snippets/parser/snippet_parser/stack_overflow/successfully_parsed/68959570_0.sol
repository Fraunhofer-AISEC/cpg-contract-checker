function dedupe(string[] memory keys) public pure returns(string[] memory) {
        string[] memory deduped;
        mapping(string=>bool) map;
        string memory ikey;
        for(uint i=0; i<keys.length; i++) {
            ikey = keys[i];
            if (!map[ikey]) {
                map[ikey]=true;
                deduped.push(ikey);
            }
        }
        return deduped;
    }   
