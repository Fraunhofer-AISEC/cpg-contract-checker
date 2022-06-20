function sum10() external pure returns (uint256) {
    uint256 result;
    for(uint256 i; i< 10; i++){
       result += i;
    }
    return result;
}
