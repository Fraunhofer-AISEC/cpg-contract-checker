modifier onlyOwner() {
    if (msg.sender != owner) {
    Error('Mortal: onlyOwner function called by user that is not owner'); throw;
    }
    _;
}

modifier onlyIssuer() {
    if (!issuers[phoneNumbers[msg.sender]]) {
    Error('Mobile: onlyIssuer function called by user that is not an authorized issuer'); throw;
    }
    _;
}
