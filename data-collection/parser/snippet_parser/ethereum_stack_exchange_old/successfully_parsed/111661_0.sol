contract Demo {

    uint256 sharedCounter;

    function countUp() external {
        sharedCounter = sharedCounter+1;
    }
}
