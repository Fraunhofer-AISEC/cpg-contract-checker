function extract(uint random, uint length, uint start) internal pure returns (uint) {
        return (((1 << (length * 8)) - 1) & (random >> ((start * 8) - 1)));
    }
