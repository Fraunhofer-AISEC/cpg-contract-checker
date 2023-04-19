function generateSeed(uint256 tokenId) public view returns (uint256) {
    uint256 r = random(tokenId);
    uint256 headSeed = 100 * (r % 7 + 10) + ((r >> 48) % 20 + 10);
    uint256 faceSeed = 100 * ((r >> 96) % 6 + 10) + ((r >> 96) % 20 + 10);
    uint256 bodySeed = 100 * ((r >> 144) % 7 + 10) + ((r >> 144) % 20 + 10);
    uint256 legsSeed = 100 * ((r >> 192) % 2 + 10) + ((r >> 192) % 20 + 10);
    return headSeed;
