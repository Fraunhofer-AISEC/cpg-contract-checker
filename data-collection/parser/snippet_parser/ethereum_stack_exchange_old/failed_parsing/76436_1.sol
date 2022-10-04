contract SomeContract {

   getTokenBalance(address tokenAddress, address owner) returns (uint){
      ERC20 erc = ERC20(tokenAddress);
      return erc.balanceOf(owner);
   }

}
