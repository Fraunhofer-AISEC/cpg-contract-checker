event OwnershipTransferred(address indexed _from, address indexed _to);

constructor() {
    owner = msg.sender;
}

function transferOwnership(address _to) public {
    require(msg.sender == owner);
    newOwner = _to;
}

function acceptOwnership() public {
    require(msg.sender == newOwner);
    emit OwnershipTransferred(owner, newOwner);
    owner = newOwner;
    newOwner = address(0);
}
