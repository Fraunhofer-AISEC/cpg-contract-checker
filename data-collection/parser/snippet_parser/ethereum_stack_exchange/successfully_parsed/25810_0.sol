contract SimpleExample {
    function getSender() constant returns (address) {
        return msg.sender;
    }
}
