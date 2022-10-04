uint u = 200;
bytes32 b = bytes32(u);
bytes memory c = new bytes(32);
for (uint i=0; i < 32; i++) {
    c[i] = b[i];
}
