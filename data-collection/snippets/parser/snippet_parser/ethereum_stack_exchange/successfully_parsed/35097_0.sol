function multiMint(uint nonce, uint256[] bits) onlyOwner {
    require(!mintingStopped);
    if (nonce != mintingNonce) return;
    mintingNonce += 1;
    uint256 lomask = (1 << 96) - 1;
    uint created = 0;
    for (uint i=0; i<bits.length; i++) {
        address a = address(bits[i]>>96);
        uint value = bits[i]&lomask;
        balanceOf[a] = balanceOf[a] + value;
        controller.ledgerTransfer(0, a, value);
        created += value;
    }
    totalSupply += created;
}
