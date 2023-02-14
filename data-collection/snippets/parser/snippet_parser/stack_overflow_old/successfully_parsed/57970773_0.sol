function becomeRichest() public payable returns (bool) {
    if (msg.value > mostSent) {
        richest = msg.sender;
        mostSent = msg.value;
        amount += msg.value;
        players++;
        return true;
    } else {
        amount += msg.value;
        players++;
        return false;
    }
}
