totalTokensSold = 0
tokens = _amount.mul(testPerUsdc)-->
tokens = 50k * 1= 50000*10**18 * 1e18/uint256(950000)--> 
(to make easier change 95000 to 100000) -->
tokens = 50k * 1= 50000*10**18 * 1e13 
and this is greater than your HardcCap of 85*10**1e18
