

pragma solidity ^0.8.0;

import "./hip-206/HederaTokenService.sol";
import "./hip-206/HederaResponseCodes.sol";

contract Mint is HederaTokenService{

   address tokenAddress
   string public uri = "abc"
 

       function mint(uint64 _amount) external {
       (
           int256 response,
           uint64 newTotalSupply,
       ) = HederaTokenService.mintToken(tokenAddress, _amount, uri);
       if (response != HederaResponseCodes.SUCCESS) {
           revert("Mint Failed");
       }

