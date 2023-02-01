function max(uint256[] memory numbers) external pure returns (uint256) {
    require(numbers.length > 0); 
    uint256 maxNumber; 

    for (uint256 i = 0; i < numbers.length; i++) {
        if (numbers[i] > maxNumber) {
            maxNumber = numbers[i];
        }
    }

    return maxNumber;
}
