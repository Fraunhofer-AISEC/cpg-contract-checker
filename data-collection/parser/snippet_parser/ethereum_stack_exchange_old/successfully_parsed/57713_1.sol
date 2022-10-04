function compareStrings() returns(bool) {
    string a = "test";
    return keccak256(a) == keccak256(a);
}
