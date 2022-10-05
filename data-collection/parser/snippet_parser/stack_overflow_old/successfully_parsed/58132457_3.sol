function set(bytes8 rfidnumber, Landpaper memory _landpaperRecord) public Permission {
    lp[rfidnumber]=_landpaperRecord;
}

function get(bytes8 rfidnumber) public view returns(Landpaper memory) {
    return lp[rfidnumber];
}
