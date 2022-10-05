contract BARNGenerator {

    function BARNGenerator() {

    }

    function getRandomNumber(
        uint _base, 
        uint _endBlock, 
        uint _confirmationLength,
        uint _blockSets) returns(uint) {

        uint[] numberArray;        
        uint totalBlocks = _blockSets * _confirmationLength;
        if (_endBlock - totalBlocks < block.number) {revert();}
        for (uint i; i < totalBlocks; i++) {
            numberArray.push(uint(block.blockhash(_endBlock - i)) % _base);
        }
        return convertToDecimal(numberArray, _base);
    }

    function convertToDecimal(uint[] bitArray, uint _base) returns(uint) {
        uint decimalSum = 0;
        for (uint i=0; i< bitArray.length; i++) {
            decimalSum += bitArray[i] * _base ** (i + 1);
        }
        return decimalSum;
    }

}
