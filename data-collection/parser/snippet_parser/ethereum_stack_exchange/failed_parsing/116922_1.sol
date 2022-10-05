
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract A {
   ERC20 B;

   constructor(address _token){
      B = _token;
   }
   function example() public {
      if(B.name() == "My Token"){
          ...
      }
 
 B._transfer();
   }
}
