address public owner;

modifier onlyOwner() {
    require(msg.sender == owner);
    _;
}

constructor() {
    owner = msg.sender;
}

function transferOwnership(address _owner) onlyOwner {
    owner = _owner;
}
