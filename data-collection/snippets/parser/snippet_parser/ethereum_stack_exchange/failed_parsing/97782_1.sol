Constants

Fee is 1% (assuming no burn, just a general 1% fee)

tTotal is totalSupply and literally never changes
rTotal starts at 127366483000000 and continuously subtracts or adds
currentRate 

Example:

You buy 100 Token as tAmount

>>>

Current Totals:
rTotal = 127366483000000
tTotal = 10000

currentRate = rTotal / tTotal
= 12736648300

Formula to get amount you will receive
> rTransferAmount = [rAmount] - [rFee]
[rAmount] = tAmount * currentRate
> 1273664830000 = 100 * 12736648300
[rFee] = tFee * currrentRate
> 127366483 = .01 * 12736648300

>>> 1273537463517 = [rAmount] - [rFee] = rTransferAmount

rTotal is updated to = rTotal - rTransferAmount 

balanceOf():

= rAmount / currentRate
> 

rAmount[me] is rAmount
rAmount = 1273537463517
currentRate = 12735374635.17

Balance: 100

...Someone else makes a transfer from x0 supply to buy 100 Tokens

rTotal = 126092945536483
tTotal = 10000

currentRate = rTotal / tTotal
= 12609294553.6483

Formula to get amount you will receive
> rTransferAmount = [rAmount] - [rFee]
rAmount = tAmount * currentRate
> 1260929455364.83 = 100 * 12609294553.6483
rFee = tFee * currrentRate
> 126092945.536483 = .01 * 12609294553.6483

>>> rTransferAmount = 1260803362419.293517

They now have 100

...Now check [me] balance after previous purchase


balanceOf():

= rAmount / currentRate

rAmount[me] is rAmount
rAmount = 1273537463517
currentRate = 12609294553.6483

Balance: 100.9998979799010304029995929297


...Now lets buy 100 more directly after checking balance
...this is the next transaction after the previous one

rTotal = 124832142174063.706483
tTotal = 10000

currentRate = rTotal / tTotal
= 12483214217.4063706483

Formula to get amount you will receive
> rTransferAmount = [rAmount] - [rFee]
rAmount = tAmount * currentRate
> 1248321421740.63706483 = 100 * 12483214217.4063706483
rFee = tFee * currrentRate
> 124832142.174063706483 = .01 * 12483214217.4063706483

>>> rTransferAmount = 1248196589598.463001123517

We now take our previous rAmount and add the rTransferAmount to update our rAmount

> rOwned[me] = rOwned[me] + rTransferAmount 
> 2521734053115.463001123517 = 1273537463517 + 1248196589598.463001123517

...Now check [me] balance after previous purchase


balanceOf():

= rAmount / currentRate

rAmount[me] is rAmount
rAmount = 2521734053115.463001123517
currentRate = 12483214217.4063706483

Balance: 202.00999591909607202719956134358


... now lets sell 100

rTotal = 123583945584465.243481876483
tTotal = 10000

currentRate = rTotal / tTotal
= 12358394558.4465243481876483

Formula to get amount you will receive
> rTransferAmount = [rAmount] - [rFee]
rAmount = tAmount * currentRate
> 1235839455844.65243481876483 = 100 * 12358394558.4465243481876483
rFee = tFee * currrentRate
> 123583945.584465243481876483 = .01 * 12358394558.4465243481876483

>>> rTransferAmount = 1235715871899.067969575282953517

We now take our previous rAmount and add the rTransferAmount to update our rAmount

(we are subtracting because we are selling)

> rOwned[me] = rOwned[me] - rTransferAmount 
> 1286018181216.395031548234046483 = 2521734053115.463001123517 - 1235715871899.067969575282953517

rTotal is updated to = rTotal - rTransferAmount 
122348229712566.17551230120004648 = 123583945584465.243481876483 - 1235715871899.067969575282953517

...Now check [me] balance after previous purchase

balanceOf():

= rAmount / currentRate

rAmount[me] is rAmount
rAmount = 1286018181216.395031548234046483
currentRate = 12358394558.4465243481876483

Balance: 104.06029481697096470326753341015
