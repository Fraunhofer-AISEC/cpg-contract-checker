uint8 [10][10][100][100] public blocks;
function getBlock(uint x, uint y) returns (uint8[10][10]) {
    if (x < blockStoreSide && y < blockStoreSide) {
        return blocks[x][y];
    }
}
