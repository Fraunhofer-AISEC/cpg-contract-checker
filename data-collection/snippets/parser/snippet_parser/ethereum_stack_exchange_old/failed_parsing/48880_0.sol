contract V {
    Random api = Random(0xAddress);

    function roll(uint guess) public payable {
        if (api.random(6) == guess) {
            msg.sender.transfer(msg.value * 2);
        }
    }
}
