function getTrackDetailsByIswc(bytes32 _iswc) public constant returns(bytes32[]) {

    getCount(_iswc);
    bytes32[] memory isrc = new bytes32[](c);

    bytes32 tempiswc;
    uint count = KeyArray.length;
    uint j;

    for (uint8 i=0; i < count; i++) {
        tempiswc = track[KeyArray[i]].iswc;
        if (tempiswc == _iswc) {
            isrc[j] = KeyArray[i];
            j++;
        }
    }
    return isrc;
} 
