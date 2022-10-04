contract SomeContract {
   ERC20 erc;

  constructor(tokenAddress){
      erc = ERC20(tokenAddress)
  }


   getTokenBalance(address owner) returns (uint){
      return erc.balanceOf(owner);
   }
}
