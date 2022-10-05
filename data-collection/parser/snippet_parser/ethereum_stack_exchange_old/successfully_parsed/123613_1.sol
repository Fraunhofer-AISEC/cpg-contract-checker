
pragma solidity >= 0.6.0 < 0.9.0;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe {

    mapping(address => uint256) public addressToAmountFunded;

    function fund() public payable {
        addressToAmountFunded[msg.sender] += msg.value;
    }

    function getPrice() public view returns (uint256) {
        
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
        (,int256 answer,,,) = priceFeed.latestRoundData();
        return uint256(answer);
    }

}
