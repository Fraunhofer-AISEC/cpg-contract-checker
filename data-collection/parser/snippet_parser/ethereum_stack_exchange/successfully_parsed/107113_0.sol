pragma solidity ^0.6.6;
import '@uniswap/v2-periphery/contracts/UniswapV2Router02.sol';
import "@chainlink/contracts/src/v0.6/interfaces/AggregatorV3Interface.sol";


contract SwapAtUniswap {
    
  
   UniswapV2Router02 internal router;
   AggregatorV3Interface internal ethUsdPriceFeed;
   AggregatorV3Interface internal linkUsdPriceFeed;
   address [] public wethLinkKovanPath;
   uint256 constant denom = 1000;
   uint256 deadline;
   
   
    
   constructor(address payable _router, address _ethUsdPriceFeed, address _linkUsdPriceFeed) public {
       router = UniswapV2Router02 (_router);
       ethUsdPriceFeed = AggregatorV3Interface(_ethUsdPriceFeed);
       linkUsdPriceFeed = AggregatorV3Interface(_linkUsdPriceFeed);
    }
    
    function swapETHForLink(uint _amountOut, address[] memory _wethLinkKovanPath, address to, uint _deadline) public  {
        uint256 ethUsdPrice = getLatestEthUsdPrice();
        uint256 linkUsdPrice = getLatestLinkUsdPrice(); 
        deadline = _deadline;
        wethLinkKovanPath = _wethLinkKovanPath;
        uint256 i;
        for (i = 0; i < 1; i ++) {
            if ( (linkUsdPrice/ethUsdPrice) <= 9/denom ) {
                router.swapETHForExactTokens(_amountOut, wethLinkKovanPath, to , deadline);
           
            }
        }
    }
    
    function getLatestEthUsdPrice() public view returns(uint256) {
    (
      uint80 roundID,
      int price,
      uint startedAt,
      uint timeStamp,
      uint80 answeredInRound
    ) = ethUsdPriceFeed.latestRoundData();
    return uint256(price);
  }
    
    function getLatestLinkUsdPrice() public view returns(uint256) {
    (
      uint80 roundID,
      int price,
      uint startedAt,
      uint timeStamp,
      uint80 answeredInRound
    ) = linkUsdPriceFeed.latestRoundData();
    return uint256(price);
  }
       
      
}
