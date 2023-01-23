constructor(address payable _token) {
    lotteryOperator = msg.sender;
    expiration = block.timestamp + duration;
    tokenAddress = _token;
    lotteryId = 1;
}
