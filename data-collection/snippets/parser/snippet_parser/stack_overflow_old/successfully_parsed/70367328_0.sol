

mapping(address => uint256) public addressToAmountFunded;

function fund() public payable {
    
    uint256 minimumUSD = 50 * 10 ** 18;
    
    require(getConversionRate(msg.value) >= minimumUSD, "You need to spend more ETH!");
    addressToAmountFunded[msg.sender] += msg.value;
    

}

function getVersion() public view returns (uint256) {
    AggregatorV3Interface priceFeed = AggregatorV3Interface(0x9326BFA02ADD2366b30bacB125260Af641031331);
    return priceFeed.version();
}

function getPrice() public view returns(uint256) {
    AggregatorV3Interface priceFeed = AggregatorV3Interface(0x9326BFA02ADD2366b30bacB125260Af641031331);
    (, int price,,,
    ) = priceFeed.latestRoundData();
    return uint256(price * 10000000000);

}


function getConversionRate(uint256 ethAmount) public view returns (uint256) {
    uint256 ethPrice = getPrice();
    uint256 ethAmountInUsd = (ethPrice * ethPrice) / 1000000000000000000;
    return ethAmountInUsd;
}

function withdraw() payable public {
    msg.sender.transfer(address(this).balance);
}
