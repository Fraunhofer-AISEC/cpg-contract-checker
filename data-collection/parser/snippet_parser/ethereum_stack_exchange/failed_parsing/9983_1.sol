modifier canTrade {
    if (!balances[msg.sender].passedKYC) throw;
    _;
}

function Transfer(address to, uint256 amount) canTrade {
    .....(usual stuff here)
}
