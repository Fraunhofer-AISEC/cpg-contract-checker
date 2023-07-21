constructor() {
    Recipient[] storage recipients = reward.recipients; 
    recipients[0] = Recipient(msg.sender, 1);
    reward.recipients = recipients;
    reward.timestamp = block.timestamp;
}
