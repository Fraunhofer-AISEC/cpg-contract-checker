pragma solidity ^0.4.24;
pragma experimental ABIEncoderV2;

contract ArrayOperation {

    string[] public arr;

    function append(string str) public {
        arr.push(str);
    }

    function removeByKey(string key) public {
        for(uint256 i = 0; i < arr.length; i++) {
            if(keccak256(abi.encodePacked(arr[i])) == keccak256(abi.encodePacked(key))){
                
                for (uint256 j = i; j < arr.length - 1; j ++){
                    arr[j] = arr[j + 1];
                }
                
                delete arr[arr.length - 1];
                arr.length --;
                break;
            }
        }
    }

    function getLen() public view returns(uint256) {
        return arr.length;
    }

    function getArr() public view returns(string[] memory) {
        return arr;
    }

}
