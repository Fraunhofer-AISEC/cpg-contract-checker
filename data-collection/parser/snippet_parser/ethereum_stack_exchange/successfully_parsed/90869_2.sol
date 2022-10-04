
pragma solidity ^0.6.12;
pragma experimental ABIEncoderV2;

contract Test {

   uint[16] public teamScheduleU;
   string[16] public teamScheduleS;

   function init() external {
     
     for (uint i=0; i<15; i++) {
         teamScheduleU[i] = i;
     }
    
     
     teamScheduleS[0]='a';
     teamScheduleS[1]='b';
     teamScheduleS[2]='c';
     teamScheduleS[3]='d';
   }

   function showUint() external view returns (uint[16] memory) {
     return teamScheduleU;
   } 

   function showString() external view returns (string[16] memory) {
     return teamScheduleS;
   }
}
