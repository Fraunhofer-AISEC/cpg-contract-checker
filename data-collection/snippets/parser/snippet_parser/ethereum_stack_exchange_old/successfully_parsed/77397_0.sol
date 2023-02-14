pragma solidity ^0.5.0;

import "https://github.com/niguezrandomityengine/ethereumAPI/nreAPI.sol";

contract Randomness is usingNRE {

   function randomNumber() public view returns (uint256){

       return (uint256(keccak256((rw()/(10**20))%(10**12))));
   }

}
