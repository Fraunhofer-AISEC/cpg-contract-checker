mapping(address => uint) startTime;

function start() {
    startTime[msg.sender] = now;
}

function hasElapsed() constant return (bool) {
    if (now >= startTime[msg.sender] + 60 minutes) {
        
        return true;
    }
    return false;
}
