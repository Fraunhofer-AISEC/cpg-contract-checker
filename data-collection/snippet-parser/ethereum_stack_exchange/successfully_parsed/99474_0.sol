    function append(string a, address b) internal pure returns (string) {

    return string(abi.encodePacked(a, b));

}
