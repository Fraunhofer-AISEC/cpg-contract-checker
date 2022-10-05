function x(uint256 _value) public view returns (uint256) {
    require(getAvailableReserveUSD(0) > 0);                     

    uint256 maxReserveAvailable = address(this).balance * getEthPrice() * percentDropBeforeBonds / 100;
    uint256 m = 2 * maxReserveAvailable / ((maxReservePriceDeviationInCents * 10**24)**2);
    uint256 amountReserveUsedUp = maxReserveAvailable - uint(getAvailableReserveUSD(0));
    return sqrt(2 * (amountReserveUsedUp + _value) / m);
}
