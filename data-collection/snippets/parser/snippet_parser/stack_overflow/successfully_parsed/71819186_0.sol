contract TestContract {
    uint32[4] testArray;

    constructor(uint32[4] memory seeds) {
        testArray = seeds; 
    }

    function Show() public returns (uint32[4] memory) {
        return testArray;
    }
}
