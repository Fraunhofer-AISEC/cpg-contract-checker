function equity_in_Hadcoins(address investor) external constant returns (uint) {
    return equity_Hadcoins[investor];
} 

function equity_in_usd(address investor) external constant returns (uint) {
    return equity_usd[investor];
} 

function buy_Hadcoins(address investor, uint usd_invested) external  can_buy_Hadcoins(usd_invested) {
    uint  Hadcoins_bought = usd_invested * usd_to_Hadcoins;
    equity_Hadcoins[investor] += Hadcoins_bought;
    equity_usd[investor] = equity_Hadcoins[investor] / 1000;
    total_Hadcoins_bought ;
}
