contract ShiftDemo {
    bytes32 public s;

    function execute(bytes3 d, uint256 idx)public {
        s = s | (bytes32(d) >> (idx*8));
    }
}
