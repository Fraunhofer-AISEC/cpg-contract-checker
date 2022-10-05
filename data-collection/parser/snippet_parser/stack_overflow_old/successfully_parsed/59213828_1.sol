pragma solidity ^0.5.12;

contract Ballot {
    function convertUintToInt(uint256[] memory _input) public pure returns(int[] memory){
    int[] memory tmpArr = new int[](_input.length);
     for(uint i = 0; i < _input.length; i++){
         tmpArr[i] = int(_input[i]);
     }

    return tmpArr;
  }
}
