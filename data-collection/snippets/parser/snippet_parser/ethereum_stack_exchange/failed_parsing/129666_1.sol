
address owner;

constructor() {
    owner = msg.sender;
}

function isOwner() external returns (bool) {
    return msg.sender == owner;
}

modifier onlyOwner {
    require(isOwner(), "Only owner allowed");
    _;
}

function sensitiveFunc() external onlyOwner {
    
}
