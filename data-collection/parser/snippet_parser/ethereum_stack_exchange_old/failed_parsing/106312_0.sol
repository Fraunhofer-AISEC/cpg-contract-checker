modifier discountCHI {
    uint gasStart = gasleft();
    _;
    uint gasSpent = 21000 + gasStart - gasleft() + 16 * msg.data.length;
    chi.freeFromUpTo(address(this), (gasSpent + 14154) / 41947);
}
