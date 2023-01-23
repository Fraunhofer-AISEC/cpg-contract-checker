contract MarketMaker {
address iplogic;
address ipxaddr;
function MarketMaker(address _iplogic, address _ipx) {
    iplogic = _iplogic;
    ipxaddr = _ipx;
    log(ipxaddr);
    log(_ipx);
}
event log(address ipx);
function createNewMarket(string prop, uint256 minBet, bool initUtility) onlyIplogic returns (address, address) {
    log(ipxaddr);
    log(iplogic);}
}