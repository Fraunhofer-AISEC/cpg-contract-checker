contract MyContract {
    uint256 public lastRun = 1;

    function setv(uint256 vv) public {
            lastRun = vv;
    }
}
