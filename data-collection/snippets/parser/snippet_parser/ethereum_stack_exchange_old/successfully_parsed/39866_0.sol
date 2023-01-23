function () payable {
    uint money = msg.value;
    uint half = money / 2;
    msg.sender.transfer(half);
}
