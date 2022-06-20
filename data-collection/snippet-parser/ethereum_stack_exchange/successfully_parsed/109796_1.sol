
    function deleteAt(string[] storage ar, uint pos) public {
        uint len = ar.length;
        for(uint i = pos; i<len-1; i++) {
            ar[i]=ar[i+1];
        }
        ar.pop();
    }
