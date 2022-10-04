function myMapping(uint256 _index, uint256 _arrayIndex) 
    external
    view
    returns (uint256) 
{
    return myMapping[_index][_arrayIndex];
}
