

pragma solidity >=0.7.0 <0.9.0;

contract Arrays {

    function test() public pure returns (uint[3] memory, uint[] memory) {
        uint[3] memory testArray;
        testArray[0] = 3;
        testArray[1] = 4;
        testArray[2] = 5;
        
        uint[] memory testArray2 = new uint[](3);
        testArray2[0] = 13;
        testArray2[1] = 14;
        testArray2[2] = 15;
        
        return (testArray, testArray2);
    }
}
