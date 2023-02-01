pragma solidity ^0.4.7;    


contract BasicCounter {
    uint private counter = 0;
    function incrementAndGet() external returns (uint) {
        counter++;
        return counter;
    }
}
