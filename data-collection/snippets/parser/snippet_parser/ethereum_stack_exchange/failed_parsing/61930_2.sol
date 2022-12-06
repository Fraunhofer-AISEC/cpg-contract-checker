modifier sentEnoughCash(uint amount) {
    if (msg.value < amount) {
        revert();
    }

    if (player1 == 0) {
        currentGameCost = msg.value;
    } else if (msg.value != currentGameCost) {
        revert();
    }

    _;
}
