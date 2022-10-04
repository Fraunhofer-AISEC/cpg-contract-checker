uint8 [10][10][100][100] public blocks;     
function getBlock(uint x, uint y) constant returns (uint8[10][10]) {
    if (x < blockStoreSide && y < blockStoreSide) {
        return blocks[x][y]; 
    } 
}
