function getFirstname(string uid) constant returns (string retFirstname) {
    retFirstname = ProfileData[uid].fname;
    return retFirstname;
}
