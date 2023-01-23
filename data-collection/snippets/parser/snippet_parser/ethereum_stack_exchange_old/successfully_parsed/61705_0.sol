function approve(address guy, uint wad) public returns (bool) {
    _approvals[msg.sender][guy] = wad;

    Approval(msg.sender, guy, wad);

    return true;
}
