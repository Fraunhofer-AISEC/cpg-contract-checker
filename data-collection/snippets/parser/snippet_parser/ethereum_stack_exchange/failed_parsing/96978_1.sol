address payable[] public recipients;

...

modifier onlyOwner {
    require(
        msg.sender == owner,
        "Only the contract owner can call this function"
    );
    _;
}

function addRecipient(address payable payee) public onlyOwner {
    recipients.push(payee);
}
