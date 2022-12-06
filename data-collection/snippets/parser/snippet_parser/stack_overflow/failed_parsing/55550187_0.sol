    function stringToUint256(string memory s) internal pure 
    returns (uint256, bool) {
    bool hasError = false;
    bytes memory b = bytes(s);
    uint256 result = 0;
    uint256 oldResult = 0;
    for (uint i = 0; i < b.length; i++) { 
        if (b[i] >= 48 && b[i] <= 57) {
            
            oldResult = result;
            result = result * 10 + (uint256(bytes(b[i]) - 48) ; 
            
            if(oldResult > result ) {
                
                hasError = true;
            }
        } else {
            hasError = true;
        }
    }
    return (result, hasError); 
}
