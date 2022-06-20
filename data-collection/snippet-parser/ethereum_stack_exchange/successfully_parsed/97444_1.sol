function highestOrderDigitIsX(uint256 number, uint256 x) public pure returns (bool) { 
    while (number >= 10) {
        number /= 10;
    }
    
    return number == x;
}
