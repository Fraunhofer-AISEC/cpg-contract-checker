function func() public returns (bool) {
    if (some condition on msg.sender) {
        do some stuff
        return true;
    }
    revert();
}
