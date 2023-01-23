contract Inbox {
    string public message;

    constructor(string memory initialMessage) public {
        message = initialMessage;
    }
}