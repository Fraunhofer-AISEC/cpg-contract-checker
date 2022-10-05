function transfer (address to, uint value) public returns (bool) {
    payOutDividends (msg.sender);
    payOutDividends (to);

    ...
}
