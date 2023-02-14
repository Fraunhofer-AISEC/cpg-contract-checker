function getSlice(uint256 begin, uint256 end, string text) public pure returns (string) {
    bytes memory a = new bytes(end-begin+1);
    for(uint i=0;i<=end-begin;i++){
        a[i] = bytes(text)[i+begin-1];
    }
    return string(a);    
}
