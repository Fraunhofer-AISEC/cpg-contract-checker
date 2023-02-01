pragma solidity ^0.5.2;


contract ArrayTest {
    uint [] public numbers;
    function getNumberCount() public view returns(uint count) {
        return numbers.length;
    }
    function addIfNotPresent(uint num) public{
        uint arrayLength = numbers.length;
        bool found=false;
        for (uint i=0; i<arrayLength; i++) {
            if(numbers[i]==num){
                found=true;
                break;
            }
        }
        if(!found){
            numbers.push(num);
        }
    }
}
