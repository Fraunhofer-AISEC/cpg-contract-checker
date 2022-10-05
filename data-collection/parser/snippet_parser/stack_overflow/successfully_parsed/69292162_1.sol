pragma solidity ^0.8.0;
 
contract EstimateGas {
    uint[] public fooArray;
    constructor (){
        for (uint256 i = 0; i < 500; ++i) {
            fooArray.push(i);
        }
    }
    function changeNoTemp() public{
        for (uint256 i = 0; i < fooArray.length; ++i) {
            fooArray[i] = fooArray[i] +1;
        }        
    }
    function changeWithTemp() public{
        uint arrayLen = fooArray.length;
        for (uint256 i = 0; i < arrayLen; ++i) {
            fooArray[i] = fooArray[i] +1;
        }        
    }    
}
