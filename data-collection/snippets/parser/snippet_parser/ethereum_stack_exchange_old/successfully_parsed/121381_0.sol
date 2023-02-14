function addAllowedToken(string memory _priceFeedName, address _token, address _priceFeedAddress) external onlyOwner {
    allowedTokens.push(_token);
    AggregatorV3Interface _priceFeedName = new AggregatorV3Interface(_priceFeedAddress);

}
