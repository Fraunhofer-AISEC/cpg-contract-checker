import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract TravelCoin{

    AggregatorV3Interface internal priceFeed;

    constructor() {
        priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
    }

    function getLatestPrice() public view returns (uint) {
        (, int price,,,) = priceFeed.latestRoundData();
        return uint (price*1e18);
    }

    function GetValueInEth(uint dollarsAmount) public view returns (uint) {
        uint valuePrice = uint(getLatestPrice());
        uint ethAmount = (dollarsAmount*1e18)/valuePrice;
        return ethAmount;
    }
}
