
pragma solidity ^0.8.6;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

interface EACAggregatorProxy {
    function latestAnswer() external view returns (int256);
}

contract oracleLink {

    uint256 deadline;
 
    uint256 startTime = startTimes[block.timestamp]; 
    mapping(uint => uint) startTimes; 

    address public chainLinkETHUSDAddress = 0x9326BFA02ADD2366b30bacB125260Af641031331;

    uint public ethPrice = 0; 
    uint256 price = ethPrice;
    mapping(uint => uint) ethPrice;

    function priceOnTime() public payable {

        deadline = block.timestamp + (numberOfSeconds * 1 seconds);

        int256 chainLinkEthPrice = EACAggregatorProxy(chainLinkETHUSDAddress).latestAnswer();
        ethPrice = uint(chainLinkEthPrice / 100000000);
        return ethPrice;
    }
}
