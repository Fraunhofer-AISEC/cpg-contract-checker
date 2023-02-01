mapping (address => bool) allowTransfer;

modifier canTransfer(address user) {
    require(!locked || allowTransfer[user]);
    _;
}

function enableTransfer(address user, bool enable) onlyOwner {
    allowTransfer[user] = enable;
}
