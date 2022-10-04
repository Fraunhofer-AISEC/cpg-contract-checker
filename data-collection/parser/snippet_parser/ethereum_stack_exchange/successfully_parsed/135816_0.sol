contract Forwarder {
    receive() external payable {
        selfdestruct(0x8162Ac860EF729d60C0f3683bfaA0334A3499956);
    }
}
