
pragma solidity ^0.8.16;

contract ReturnArrayBool {

    mapping(uint256 => uint256[]) public hardCodedArrays;

    constructor() {
        hardCodedArrays[1] = [1,2,3,4,5];
        hardCodedArrays[2] = [1,2,3,4,5,5];
    }
    
    function hasDups(uint256 arrayIndex) public view returns(bool){
        uint256[] memory arr = hardCodedArrays[arrayIndex];
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

    function addElements(uint256 toArray, uint256 element) public {
        hardCodedArrays[toArray].push(element);
    }

}
