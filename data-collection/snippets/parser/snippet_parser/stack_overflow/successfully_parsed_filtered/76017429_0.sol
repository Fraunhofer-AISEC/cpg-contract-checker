function request() public {
  Chainlink.Request memory req = buildChainlinkRequest('ca98366cc7314957b8c012c72f05aeeb', address(this), this.fulfill.selector);
  req.add(
      'get',
      'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=ETH&tsyms=USD'
  );
  req.add('path', 'RAW,ETH,USD,VOLUME24HOUR');
  req.addInt('times', 10**18); 
  sendChainlinkRequest(req, (1 * LINK_DIVISIBILITY) / 10); 
}
