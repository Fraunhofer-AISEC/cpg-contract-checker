contract X {
    uint8[] public arr8 = [3,4,5];
    uint256[] public arr256;

    function myFunc(uint[] _arr256) public {
        arr256 = _arr256;
    }

    function proxyFunc(uint8[] _arr8) public {
        uint[] memory _arr256 = new uint[](_arr8.length);
        for (uint i = 0; i < _arr8.length; i++) {
            _arr256[i] = uint256(_arr8[i]);
        }
        myFunc(_arr256);
    }
}
