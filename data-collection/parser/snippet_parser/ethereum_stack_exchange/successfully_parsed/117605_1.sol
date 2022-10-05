function removeIndex(uint256 index) external
{   
    require(index < temp.length);

    for(uint256 i = index ; i < temp.length - 1; i ++)
    {
        temp[i] = temp[i + 1];
    }

    temp.pop();
}
