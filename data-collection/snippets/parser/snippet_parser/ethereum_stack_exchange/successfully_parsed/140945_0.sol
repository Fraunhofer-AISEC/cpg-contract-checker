function sortFixedArray(uint256[6] memory array) public pure returns 
         (uint256[6] memory sortedArray) {
    
    sortedArray = array; 
    uint ceiling;
    uint last;
    uint highIndex;

    for (uint i = 0; i < 6;) {
        last = sortedArray[5];
       
        if (sortedArray[i] > 1 && sortedArray[i] > ceiling) {
            ceiling = sortedArray[i];
            highIndex = i;
        }
        unchecked { i++; }
    }
    sortedArray[5] = ceiling;
    if (highIndex < 5) {
        sortedArray[highIndex] = last;
    }
    sortedArray[5] = ceiling;
    ceiling = 0;

    return sortedArray;
}
