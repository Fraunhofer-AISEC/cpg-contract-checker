

pragma solidity >=0.6.6 <0.9.0;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe {
    
    
    mapping(address => uint256) public addressToAmountFunded;
    address public owner;
    
    constructor() {
        owner = msg.sender;
    }

    function fund() public payable {
        uint256 minimumUSD = 50 * 10 ** 18;
        require(getConversionRate(msg.value) >= minimumUSD,"You need to send more Eth");
        addressToAmountFunded[msg.sender] += msg.value;
    }

    function getVersion() public view returns (uint256){
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        return priceFeed.version();
    }

   
    function getPrice() public view returns (uint256){
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        (,int256 answer,,,)=priceFeed.latestRoundData();
        return uint256(answer * 10000000000);
    }

    
    function getConversionRate(uint256 ethAmount) public view returns (uint256){
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount)/ 1000000000000000000; 
        return ethAmountInUsd;
    }
    
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
    
    function withdraw() payable public {
        msg.sender.transfer( address (this).balance);

        
    }
}
