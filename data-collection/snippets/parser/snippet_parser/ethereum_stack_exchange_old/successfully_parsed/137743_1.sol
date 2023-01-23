  function getParsed(uint256 value, uint index) external pure returns (uint cleared){
    uint move = index * 4;
    return (value >> move) & 0x000000000000000000000000000000000000000000000000000000000000000f ;        
}
