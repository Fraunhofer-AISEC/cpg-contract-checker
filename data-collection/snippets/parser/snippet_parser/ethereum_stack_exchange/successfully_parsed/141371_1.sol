pragma solidity >=0.5.0 <0.9.0;

contract Day1 {

  function reverseArray(uint[] memory arr1, uint length) public pure returns(uint[] memory){

    uint[] memory arr2 = new uint[](length);
    uint i = length-1;
    uint j = 0;

    while(i>0 && j<length){
      arr2[j] = arr1[i]; 
      i--;
      j++;
    }

    arr2[j] = arr1[i];

    return arr2;

    }
}
