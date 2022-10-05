contract TestChainCoin is RefundableCrowdsale
{
    function TestChainCoin() RefundableCrowdsale() {
            balances[msg.sender] = 100;                                                                   
        }
}
