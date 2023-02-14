    function buyAndSellInOneFunction() public  {
   DexContract.buy();
   uint myBal = erc20.balanceOf(address(this));
   if(myBal > 0){
       DexContract.sell(myBal);
   }
}
