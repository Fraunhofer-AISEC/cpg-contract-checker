    bytes1 a = 0x67;
    bytes1 b = 0x68;
    function c() public view returns (bool) {
        return a[0] >= b[0];
    }
