contract TestContract {
    uint8   myUint8;
    uint256 myUint256;

    uint8 myUint8A;
    uint8 myUint8B;
    uint8 myUint8C;
    uint8 myUint8D;

    uint256 myUint256A;
    uint256 myUint256B;
    uint256 myUint256C;
    uint256 myUint256D;

    struct PackedUint8s {
        uint8 packedA;
        uint8 packedB;
        uint8 packedC;
        uint8 packedD;
    }

    PackedUint8s packedUint8s;

    function write8(uint8 _val) public {
        myUint8 = _newVal;
    }
    function write256(uint256 _val) public {
        myUint256 = _val;
    }

    function writeFour8s(uint8 _a, uint8 _b, uint8 _c, uint8 _d) public {
        myUint8A = _a;
        myUint8B = _b;
        myUint8C = _c;
        myUint8D = _d;
    }
    function writeFour256s(uint256 _a, uint256 _b, uint256 _c, uint256 _d) public {
        myUint256A = _a;
        myUint256B = _b;
        myUint256C = _c;
        myUint256D = _d;
    }

    function writePacked8s(uint8 _a, uint8 _b, uint8 _c, uint8 _d) public {
        packedUint8s = PackedUint8s(_a, _b, _c, _d);
    }
}
