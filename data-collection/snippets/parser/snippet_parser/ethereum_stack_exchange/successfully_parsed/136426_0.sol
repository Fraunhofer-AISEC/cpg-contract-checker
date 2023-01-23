function bp(uint value, uint bpValue) internal pure returns (uint) {
        return value.mul(bpValue).div(10000);
    }
