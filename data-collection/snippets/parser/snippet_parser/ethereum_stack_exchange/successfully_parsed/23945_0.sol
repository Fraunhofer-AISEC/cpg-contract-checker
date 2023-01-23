mapping (address => bool) userAddr;

function whitelistAddress (address user) onlyOwner { userAddr[user] = true; }
