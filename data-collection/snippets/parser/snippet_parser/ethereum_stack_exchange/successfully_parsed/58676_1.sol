function forwardFunds() internal {
    wallet.transfer(msg.value);
}
