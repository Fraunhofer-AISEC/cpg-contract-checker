
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract MyToken is ERC20 {
AggregatorV3Interface internal priceFeed;
int256 private CurrentAsk;
int256 private CurrentBid;
int256 private getLastestPrice;
constructor() ERC20("MyToken", "MTK") {
    priceFeed = AggregatorV3Interface(0x9326BFA02ADD2366b30bacB125260Af641031331);    
}

function getLatestPrice() public view returns (int256) {
    (
        uint80 roundID,
        int256 price,
        uint startedAt,
        uint timeStamp,
        uint80 answeredInRound
    ) = priceFeed.latestRoundData();
    return price;
}

function setCurrentAsk(int256 askPrice) public {
  require(askPrice > getLastestPrice,"Ask price must be higher than the lastest price");
  CurrentAsk=askPrice;
}

function setCurrentBid(int256 bidPrice) public {
  require(bidPrice > getLastestPrice, "Bid price must be higher than the latest price");
  CurrentBid=bidPrice;
}

}
