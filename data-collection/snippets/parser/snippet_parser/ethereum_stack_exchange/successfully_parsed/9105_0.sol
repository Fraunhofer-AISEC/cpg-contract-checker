modifier critical {
    if (mutex) throw;
    mutex = true;
    _;
    mutex = false;
}

function createPlayer() {
    critical; 
    var player = players[msg.sender];
    if (player.ready) { throw; }
    player.ethaddress = msg.sender;
    player.creationdate = block.timestamp; 
    player.balance += msg.value;
}
