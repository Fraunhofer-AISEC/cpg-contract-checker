bytes memory b = bytes(a);
bytes memory ret = new bytes(b.length);

for (uint256 i = 0; i < b.length; i++) {
    ret[i] = b[b.length - i - 1];
}

return string(ret);
