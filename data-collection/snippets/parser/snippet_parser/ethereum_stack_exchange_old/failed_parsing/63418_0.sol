uint eth = 1 ether;
if(tokensAmount > eth)
{
    finalPrice = pBuyPrice.mul(tokensAmount.div(eth));
}
else if(tokensAmount < eth)
{
    finalPrice = pBuyPrice.div(eth.div(tokensAmount));
}
else
{
    finalPrice = pBuyPrice;
}
