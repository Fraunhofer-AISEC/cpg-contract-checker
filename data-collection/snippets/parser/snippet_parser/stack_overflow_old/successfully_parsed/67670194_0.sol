struct TransferHistory {
    uint32 transferTime;
    address from;
    address to;
    uint256 amount;
}

mapping (address => TransferHistory[]) transferHistoryPerReceiver;

function transfer(address _to, uint256 _amount) external returns (bool) {
    require(receivedDuringPast24Hours(_to) <= 100, 'You can only receive up to 100 tokens during the past 24 hours');
}

function receivedDuringPast24Hours(address _who) external view returns (uint256) {
    
    
}
