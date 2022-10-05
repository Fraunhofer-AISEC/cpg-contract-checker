function getTrackDetailsNew(bytes32 _iswc) public constant returns(bytes32[] isrc) {  
    bytes32 s;
    for(uint8 i=0;i<count;i++) {
        s = track[isrcKeyArray[i]].iswc;
        if(s == _iswc) {  
            isrc[i] = isrcKeyArray[i];  
        }  
    }  
    return isrc;  
}
