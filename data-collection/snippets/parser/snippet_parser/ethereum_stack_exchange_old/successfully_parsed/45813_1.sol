function compareStringsbyBytes(string s1, string s2) public pure returns(bool){
    return keccak256(s1) == keccak256(s2);
}
