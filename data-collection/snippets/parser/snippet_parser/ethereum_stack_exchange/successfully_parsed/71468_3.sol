contract Counters {
    uint256[] public counters;
    event NewCounter(uint256 index);

    function createCounter() external {
        counters.push(0); 
        emit NewCounter(counters.length - 1); 
    }

    function increment(uint256 index) external {
        counters[index] += 1;
    }
}
