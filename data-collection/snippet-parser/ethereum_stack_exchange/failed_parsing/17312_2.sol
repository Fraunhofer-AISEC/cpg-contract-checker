    pragma experimental ABIEncoderV2;

    ...

    function createMemoryArray(uint size) public pure returns (uint[2][] memory) {
        uint[2][] memory b = new uint[2][](size);
        for (uint i=0; i < b.length; i++) {
            b[i][0] = i;
            b[i][1] = i * 2;
        }
        return b;
    }

    function createStringArray(uint size) public pure returns (string[] memory) {
        string[] memory b = new string[](size);
        for (uint i=0; i < b.length; i++) {
            b[i] = "test";
        }
        return b;
    }
