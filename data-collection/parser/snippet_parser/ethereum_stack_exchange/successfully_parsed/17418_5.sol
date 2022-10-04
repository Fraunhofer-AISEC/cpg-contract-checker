
function calculatePrice(uint value, address msgSender, uint decimals) 
    public 
    constant 
    returns (uint) {
    uint multiplier = 10 ** decimals;
    return value.times(multiplier) / oneTokenInWei;
}
