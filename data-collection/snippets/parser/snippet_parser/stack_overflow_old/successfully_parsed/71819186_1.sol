contract TestContract {
    uint32[4] testArray;

    constructor(uint32[4] memory seeds) {
        for(uint i = 0; i < 4; i++) {
            testArray[i] = seeds[i];  
        }
    }

    function Show() public returns (uint32[4] memory) {
        return testArray;
    }
}
