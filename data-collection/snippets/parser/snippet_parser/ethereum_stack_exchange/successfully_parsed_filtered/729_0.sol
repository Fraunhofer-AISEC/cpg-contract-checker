function append(string a, string b, string c, string d, string e) internal pure returns (string) {

    return string(abi.encodePacked(a, b, c, d, e));

}
