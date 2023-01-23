contract SampleCrowdsale is CappedCrowdsale, RefundableCrowdsale, MintedCrowdsale {


constructor(
uint256 openingTime,
uint256 closingTime,
uint256 rate,
address wallet,
uint256 cap,
ERC20Mintable token,
uint256 goal
)
public
Crowdsale(rate, wallet, token)
CappedCrowdsale(cap)
TimedCrowdsale(openingTime, closingTime)
RefundableCrowdsale(goal)
{


require(goal <= cap,"Goal <= Cap is an requirement"); 
} 



}
