constructor() {
    Recipient[] memory recipients = new Recipient[](3);
    recipients[0] = Recipient(msg.sender, 1);
    recipients[1] = Recipient(address1, 1);
    recipients[2] = Recipient(address2, 1);
    reward.timestamp = block.timestamp;

    
    for (uint256 i = 0; i < recipients.length; i++) {
        reward.recipients.push(recipients[i]);
    }
}
