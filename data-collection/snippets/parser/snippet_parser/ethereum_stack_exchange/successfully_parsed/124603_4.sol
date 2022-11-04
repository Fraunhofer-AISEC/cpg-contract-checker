function getPrice() public view returns (uint){
    (,int256 answer,,,) = priceFeedAddress.latestRoundData();
    return uint256(answer * 10 ** 9);
}
