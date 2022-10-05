

pragma solidity >=0.6.0 <0.9.0;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";



contract FundMe {

    mapping(address => uint256) public addressToAmountFunded;


    address public owner;
    constructor() public {
        owner = msg.sender;
    }

    function fund() public payable {
        uint256 minimumUSD = 50 * 10 ** 18;
        require(getConversionRate(msg.value)>= minimumUSD, "You need to spend more ETH!");
        addressToAmountFunded[msg.sender] +=msg.value;
    }
    function getVersion() public view returns(uint256) {
        AggregatorV3Interface pricefeed =AggregatorV3Interface( 0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
        return pricefeed.version();
    }
    function getPrice() public view returns(uint256) {
       (, int256 answer, , ,) = pricefeed.latestRoundData();
        return uint256(answer);
    }
    function getConversionRate(uint256 ethAmount) public view returns(uint256) {
        uint256 ethPrice = getPrice();
        uint256 ehtAmountInUsd = (ethPrice * ethAmount) / 1000000000000000000;
        return ehtAmountInUsd();
    }
    function WithDraw() public payable {
        msg.sender.transfer(address(this).balance);
    }

}
