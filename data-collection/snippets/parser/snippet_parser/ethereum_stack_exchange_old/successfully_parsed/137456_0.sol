 function buyAndSellInOneFunction(uint256 erc20Amount) public  {
       DexContract.buy(erc20Amount);
       uint myBal = erc20.balanceOf(address(this));
       if(myBal > 0){
           DexContract.sell(myBal);
       }
    }
