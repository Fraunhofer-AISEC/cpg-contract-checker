function disburseRates (uint rate, uint start, uint deadline) internal returns (address[] storage group1_, bool) {
        
        if (block.timestamp == start + (rate) || block.timestamp == (start + (rate * 3))) {
            require(deadline >= block.timestamp);
            return (_group1_, true);
}
