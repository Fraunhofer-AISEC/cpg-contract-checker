
pragma solidity ^0.8.9;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract Lottery {
    address payable[] public players; 
    uint256 public usdEntryFee;
    AggregatorV3Intefrace internal ethUsdPriceFeed;

    constructor(address _priceFeedAddress) public {
        usdEntryFree = 50 * (10**18);
        ethUsdPriceFeed = AggregatorV3Interface(_priceFeedAddress); 
    }

    function enter() public payable {
        
        
        players.push(msg.sender);
    }

    function getEntranceFee() public view returns (uint256) {}

    function startLottery() public {}

    function endLottery() public {}
}
