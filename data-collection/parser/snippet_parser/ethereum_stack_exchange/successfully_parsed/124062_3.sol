
function stringToUint(string s) constant returns (uint, bool) {
    bool hasError = false;
    bytes memory b = bytes(s);
    uint result = 0;
    uint oldResult = 0;
    for (uint i = 0; i < b.length; i++) { 
        if (b[i] >= 48 && b[i] <= 57) {
            
            oldResult = result;
            result = result * 10 + (uint(b[i]) - 48); 
            
            if(oldResult > result ) {
                
                hasError = true;
            }
        } else {
            hasError = true;
        }
    }
    return (result, hasError); 
}
