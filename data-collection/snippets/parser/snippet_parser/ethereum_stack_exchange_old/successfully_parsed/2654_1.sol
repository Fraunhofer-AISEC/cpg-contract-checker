contract C {
    event EventSendCoin(address indexed sender, address indexed receiver, uint256 amount);

    function sendCoin(address receiver, uint amount) returns (bool sufficient) {
        
        EventSendCoin(msg.sender, receiver, amount);
        return true;
    }
}
