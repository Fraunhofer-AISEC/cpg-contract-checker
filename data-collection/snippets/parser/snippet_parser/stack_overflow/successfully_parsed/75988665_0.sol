struct Recipient {
    address target;
    uint256 amount;
}

struct Reward {
    uint256 timestamp;
    Recipient[] recipients;
}

contract Mwe {
    Reward reward;

    constructor() {
        Recipient[] memory recipients = new Recipient[](1);
        recipients[0] = Recipient(msg.sender, 1);
        reward.recipients = recipients;
        reward.timestamp = block.timestamp;
    }
}
