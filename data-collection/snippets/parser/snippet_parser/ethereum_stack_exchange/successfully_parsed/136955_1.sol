    function getMax(uint256[] calldata numbers ) public pure returns(uint maxNumber) {

    uint arrayLength = numbers.length;

    for(uint index = 0; index < arrayLength; )  {

        if(numbers[index] > maxNumber)
            maxNumber = numbers[index];

        unchecked{index++;}
    }

}
