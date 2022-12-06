contract {
    struct Random {
        uint32 state;
        uint8 i;
    }

    function main() pure internal {
        Random rand = Random(seed, 0);
        ...
    }

    function get_rand(Random rand, uint8 n) pure internal returns (uint16) {
        assert(n <= 16)
        while (true) {
            if (rand.i >= 8) {
                rand.state = xorshift32(rand.state);
                rand.i = 0;
            }

            uint8 r = uint8(rand.state >> (rand.i << 4)) & 0x0f;
            rand.i += 1;

            if (r < n) {
                return r;
            }
        }
    }
}
