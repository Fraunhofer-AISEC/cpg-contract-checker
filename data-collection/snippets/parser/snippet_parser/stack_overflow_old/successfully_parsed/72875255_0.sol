
pragma solidity 0.8.5;
contract local{

   uint256 count;
   function getter() public view returns(uint256) {
       return count ;
   }

   constructor (uint256 change){
       count  = change;
  }
}
