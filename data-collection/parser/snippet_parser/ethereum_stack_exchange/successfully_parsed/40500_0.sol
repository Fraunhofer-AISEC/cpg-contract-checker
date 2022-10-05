function secondsRemaining() public view returns (uint256) {
    if (x <= now) {
        return 0;  
    } else {
        return x - now;
    }
}
