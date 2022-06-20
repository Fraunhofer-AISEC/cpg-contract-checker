function sigmoidSingle(int128 x) public pure returns(int128)
{
    
    x =  ONE + ABDKMath64x64.exp(-x);
    int128 y = ABDKMath64x64.div(ONE,x);
    return y;
    
}


function sigmoid(int128[] memory x) public pure returns(int128[] memory)
{
    uint xSize = x.length;
    int128[] memory y_Preds = new int128[](xSize);
    
    for(uint8 i = 0; i < xSize; i++ )
    {
         y_Preds[i] =  sigmoidSingle(x[i]);
    }
   
    
    return y_Preds;
}
