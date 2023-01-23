pragma solidity ^0.4.7;

contract test3 {

    uint256[5] public numbers = [1, 2, 100, 4, 5];

    function getPickWinner() public view returns(uint256){
        uint256 largest = 0; 
        uint256 i;

        for(i = 0; i < numbers.length; i++){
            if(numbers[i] > largest) {
                largest = numbers[i]; 
            } 
        }
        return largest;
    }
}
