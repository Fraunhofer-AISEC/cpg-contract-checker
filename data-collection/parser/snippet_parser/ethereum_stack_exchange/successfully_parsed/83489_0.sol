function requestWithdrawal(uint256 amount) external {

    
    uint256 timestamp = block.timestamp + 2000000;

    
    requests[msg.sender][timestamp] += amount;

    
    if (timestampLookup[msg.sender][timestamp] == false) {
        timestampLookup[msg.sender][timestamp] = true;
        timestamps[msg.sender].push(timestamp);
    }
}
