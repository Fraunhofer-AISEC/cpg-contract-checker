modifier onlyOwner() {
    require(isOwner(msg.sender), "!OWNER"); _;
}

function isOwner(address account) public view returns (bool) {
    return account == owner;
}

function transferOwnership(address payable adr) public onlyOwner {
    owner = adr;
    authorizations[adr] = true;
    emit OwnershipTransferred(adr);
}
