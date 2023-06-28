uint endTime;
address admin;

modifier isAdmin() {
    require(msg.sender == admin);
    _;
}

function setEndTime(uint timestamp) public isAdmin returns (bool) {
    
    endTime = timestamp;
    return true;
}
