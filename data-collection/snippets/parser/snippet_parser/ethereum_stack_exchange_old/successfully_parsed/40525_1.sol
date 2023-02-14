function createProxy(uint256 _expiry) internal returns(bool) {
   tokenProxy = new Proxy(baseToken, quoteToken, _expiry, price, buyer);
   require(addressHasCode(tokenProxy));
   proxy = IProxy(tokenProxy);
   return true;
}