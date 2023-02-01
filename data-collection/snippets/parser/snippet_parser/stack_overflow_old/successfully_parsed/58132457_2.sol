function set(string memory rfidnumber, Landpaper memory _landpaperRecord) public Permission {
    bytes8 rfidb8 = stringToByte8(rfidnumber);
    lp[rfidb8]=_landpaperRecord;
}

function get(string memory rfidnumber) public view returns(Landpaper memory) {
    bytes8 rfidb8 = stringToByte8(rfidnumber);
    return lp[rfidb8];
}
