
function delegate(address to) public {
    
    Voter storage sender = voters[msg.sender];
    require(!sender.voted, "You already voted.");

    require(to != msg.sender, "Self-delegation is disallowed.");

    
    
    
    
    
    
    
    
    while (voters[to].delegate != address(0)) {
        to = voters[to].delegate;

        
        require(to != msg.sender, "Found loop in delegation.");
    }
}
