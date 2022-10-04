contract MarketMaker {
    address iplogic;
    address ipxaddr;

    event log(address ipx);

    function MarketMaker(address _iplogic, address _ipx) {
        iplogic = _iplogic;
        ipxaddr = _ipx;
        log(ipxaddr);
        log(iplogic);
    }

    function createNewMarket(string prop, uint256 minBet, bool initUtility) returns (address, address) {
        log(ipxaddr);
        log(iplogic);
    }
}
