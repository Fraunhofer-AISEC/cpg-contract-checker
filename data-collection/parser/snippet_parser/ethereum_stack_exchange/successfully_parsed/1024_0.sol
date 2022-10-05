contract ReadConvertUint256Bytes {

    function equal(uint a) constant returns (bool) {
        uint x = 0;
        for (uint i = 0; i < 32; i++) {
            uint b = uint(msg.data[35 - i]);
            x += b * 256**i;
        }
        return a == x;
    }

}
