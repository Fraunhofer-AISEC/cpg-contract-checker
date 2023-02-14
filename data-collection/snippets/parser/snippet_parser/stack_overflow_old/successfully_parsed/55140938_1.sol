constructor() public payable {
        owner = msg.sender;
        fortune = msg.value;
        isDeceased = false;
    }
