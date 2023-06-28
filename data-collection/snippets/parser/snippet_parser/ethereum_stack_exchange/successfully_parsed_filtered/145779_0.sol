

pragma solidity ^0.6.6;

import "@chainlink/contracts/src/v0.6/interfaces/AggregatorV3Interface.sol";
import "@chainlink/contracts/src/v0.6/vendor/SafeMathChainlink.sol";

contract FundMe {
    using SafeMathChainlink for uint256;
    
    mapping(address => uint256) public addressToAmountFunded;
    address[] public funders;
    address public owner;
    AggregatorV3Interface public priceFeed;

    constructor(address _priceFeed) public{
        priceFeed = AggregatorV3Interface(_priceFeed);
        owner = msg.sender;
    }

    function Fund() public payable{
        addressToAmountFunded[msg.sender] = msg.value;
        uint256 minimumUSD = 1 * 10 ** 18;
        require(getConversionRate(msg.value) >= minimumUSD, "You need to spend more ETH");
        funders.push(msg.sender);
    }

    function getVersion() public view returns(uint256){
        
        return priceFeed.version();
    }
    function getDescription() public view returns(string memory){
        
        return priceFeed.description();
    }
    function getPrice() public view returns(uint256){
        
        (,int256 answer,,,) = priceFeed.latestRoundData();
        return uint256(answer * 10000000000);
    }
    function getConversionRate(uint256 ethAmount) public view returns(uint256){
        uint256 ethPrice = getPrice();
        uint256 ethAmountinUSD = (ethPrice*ethAmount) / 10**18;
        return ethAmountinUSD;
    }
    function getEntranceFee() public view returns(uint256){
        uint256 minimumUSD = 1 * 10 ** 18;
        uint256 price = getPrice();
        uint256 precision = 1 * 10 ** 18;
        return (minimumUSD* precision)/ price;
    }
    modifier onlyOwner{
        require(msg.sender == owner);
        _;
    }
    function Withdraw() payable onlyOwner public{
        msg.sender.transfer(address(this).balance);
        for(uint256 fundersIndex = 0; fundersIndex < funders.length; fundersIndex++){
            address funder = funders[fundersIndex];
            addressToAmountFunded[funder] = 0;
        }
    }
}
