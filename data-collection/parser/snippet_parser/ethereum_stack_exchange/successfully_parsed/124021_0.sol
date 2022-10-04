contract Receiver {
    bool public received;

    receive() external payable {
        received = true;
    }
}
