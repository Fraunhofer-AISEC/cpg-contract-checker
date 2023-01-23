contract SimpleExample {
    event LogSender(address sender);
    function getSender() returns (address) {
        LogSender(msg.sender);
        return msg.sender;
    }
}
