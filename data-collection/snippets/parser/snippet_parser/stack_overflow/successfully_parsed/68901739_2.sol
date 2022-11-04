
function closeVoting() public onlyOwner returns (bool) {
    
    bettingActive = false;
    return true;
}
