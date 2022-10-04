
pragma solidity ^0.6.6;
pragma experimental ABIEncoderV2;



import "@chainlink/contracts/src/v0.6/interfaces/AggregatorV3Interface.sol";

contract ChainlinkPriceFeed {
    
    int public countButtonClicks;
    int public kovanEthPrice;
    uint public kovanTimestamp;
    uint80 public kovanRoundID;
    
    
    constructor() public {
        countButtonClicks = 0;
        kovanEthPrice = -1;
        kovanTimestamp = 0;
        kovanRoundID = 0;
        
        
        
        
        
        
        
    }

    
    function getLatestPrice(address assetAddress) public view returns 
    (int price, uint80 roundID, int decimals, string memory description, uint timestamp) 
    {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(assetAddress);
        (            
            roundID, 
            price,
            uint startedAt,
            timeStamp,
            uint80 answeredInRound
        ) = priceFeed.latestRoundData();
        description = priceFeed.description();
        decimals = priceFeed.decimals();

        return (price, roundID, decimals, description, timestamp);
    }
    
    function getKovanEthPrice() public view returns (int price, uint timeStamp, uint80 roundID) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x9326BFA02ADD2366b30bacB125260Af641031331);
        (            
            uint80 roundID, 
            int price,
            uint startedAt,
            uint timeStamp,
            uint80 answeredInRound
        ) = priceFeed.latestRoundData();
        
        return (price, timeStamp, roundID);
    }
    
    function counterKovanEthPrice() public {
        countButtonClicks = countButtonClicks+1;
        (kovanEthPrice, kovanTimestamp, kovanRoundID) = getKovanEthPrice();
        
    }
}
