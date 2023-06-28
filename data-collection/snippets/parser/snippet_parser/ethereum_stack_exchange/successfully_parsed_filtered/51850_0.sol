contract Test
{
    uint256[1000] lotsOfNumbersInStorage;
    uint256[1000] moreNumbersInStorage;
    function calculateSomething(uint256 a) public view returns(uint256)
    {
        uint256[1000] memory theChosenArray;
        if (a > 0) theChosenArray = lotsOfNumbersInStorage;
        else theChosenArray = moreNumbersInStorage;
        return theChosenArray[3] * theChosenArray[a];
    }
}
