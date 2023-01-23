    function bytes3tohexstr(bytes3 i) public pure returns (string memory) {
        uint24 n = uint24(i);
        return uint24tohexstr(n);
    }
