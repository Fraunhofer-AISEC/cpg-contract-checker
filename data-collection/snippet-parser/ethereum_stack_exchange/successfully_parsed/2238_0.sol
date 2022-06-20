    function enter() {
    if (msg.value < 500 finney) {
        msg.sender.send(msg.value);
        return;
    }

    
    uint idx = participants.length;
    participants.length += 1;
    participants[idx].etherAddress = msg.sender;
    participants[idx].amount = msg.value;

    
    if (idx != 0) {
        collectedFees += msg.value / 10;
        balance += msg.value;
    } 
    else {
        
    }
}