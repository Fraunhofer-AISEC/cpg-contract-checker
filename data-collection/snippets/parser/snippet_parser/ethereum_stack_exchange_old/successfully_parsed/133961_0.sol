pragma solidity ^0.8.9;

contract ReturnArrayBool {

    uint256[] arr1 = [1,2,3,4,5];
    uint256[] arr2 = [1,2,3,4,5,5];
    
    function hasDups(uint256[] memory arr) public pure returns(bool){

        for(uint256 i = 0; i < arr.length; i++) {
            uint256 digit = arr[i];

            for(uint256 j = i+1; j < arr.length; j++) {
                if(arr[j] == digit) {
                    return true;
                }
            }   
        }
        return false;
    }
}
