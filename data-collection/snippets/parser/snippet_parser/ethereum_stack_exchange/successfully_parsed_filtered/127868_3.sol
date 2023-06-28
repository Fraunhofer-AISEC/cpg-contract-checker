
pragma solidity >0.8.0 <0.9.0;

contract Test {
   uint[] data=[1,2,3,4,5];
   function isValuePresent(uint value) external view returns(uint){
      for (uint i = 0; i < data.length; i++)
        if (data[i] == value) return i;
      return 1;
   }
}
