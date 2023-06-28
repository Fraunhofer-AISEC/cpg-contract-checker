address owner = msg.sender;

modifier onlyOwner() {
    require(msg.sender == owner);
    _;
}
