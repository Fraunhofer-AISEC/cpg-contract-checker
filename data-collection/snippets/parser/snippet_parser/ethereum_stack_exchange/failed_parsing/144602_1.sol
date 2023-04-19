WETH reserves on UniSwap were 94.7186209660738
At a price of 1 WETH / 143 FXS on Sushiswap, the output from using all that WETH would be 13544.7627981486000 FXS
Selling that amount of FXS of Uniswap at a price of 1 WETH / 142 FXS would provide a return in WETH of 95.38565351
Gas was 0.0005851026412 ETH for this transaction
There are also .3% transaction fees to account for on Uniswap and Sushiswap

So here's the calculation: 
95.38565351 - (95.38565351 * .003) - 0.0005851026412 - 94.7186209660738 - (94.7186209660738 *.003) = 0.0981357135770 ETH

Now, just for fun, what if we change the transaction fee to 30% for each?

Then the total becomes -56.1647251402709 ETH ... very close to the -55.01936314413639 ETH final calculation spurred on by getAmountsIn.  
