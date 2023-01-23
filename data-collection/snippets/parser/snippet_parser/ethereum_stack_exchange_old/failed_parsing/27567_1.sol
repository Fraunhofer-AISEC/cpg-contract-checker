bool private stopped = false;
address private owner;

modifier isAdmin() {
    require(msg.sender == owner);
    _;
}

function toggleContractActive() isAdmin public {
    
    stopped = !stopped;
}

modifier stopInEmergency { if (!stopped) _; }
modifier onlyInEmergency { if (stopped) _; }

function deposit() stopInEmergency public {
    
}

function withdraw() onlyInEmergency public {
    
}
