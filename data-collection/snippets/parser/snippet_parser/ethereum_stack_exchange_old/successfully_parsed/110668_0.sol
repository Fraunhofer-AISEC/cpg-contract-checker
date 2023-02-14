
function getRate() public view returns (uint256) {
    
    if (block.timestamp <= startTime) { return ((rate / 100) * 120); } 
    if (block.timestamp <= startTime.add(1 days)) {return ((rate / 100) * 108);} 

    return rate;
}
