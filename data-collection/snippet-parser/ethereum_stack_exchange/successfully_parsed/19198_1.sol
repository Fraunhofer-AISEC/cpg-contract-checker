function getValue(uint8 x, uint8 y) constant returns (uint8) {
    var length = 5;
    uint8[5][5] memory myArr;
    for (uint i = 0; i < length; i++)
        for (uint j = 0; j < length; j++)
            myArr[i][j] = 0;

    return myArr[x][y];
} 
