



pragma solidity ^0.8.0;


import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe {
    
    

    
    mapping(address => uint256) public addressToAmountFunded;
    
    address[] public funders;
    
    address public owner;

    
    AggregatorV3Interface public priceFeed;

    
    
    constructor(address _priceFeed) {
        owner = msg.sender;
        priceFeed = AggregatorV3Interface(_priceFeed);
    }

    function fund() public payable {
        
        uint256 minimumUSD = 50 * 10**18;
        
        require(
            getConversionRate(msg.value) >= minimumUSD,
            "You need to spend more ETH!"
        );
        
        addressToAmountFunded[msg.sender] += msg.value;
        funders.push(msg.sender);
    }

    function getEntranceFee() public view returns (uint256) {
        
        uint256 minimumUSD = 50 * 10**18;
        uint256 price = getPrice();
        uint256 precision = 1 * 10**18;
        return (minimumUSD * precision) / price;
    }

    
    function getVersion() public view returns (uint256) {
        return priceFeed.version();
    }

    function getPrice() public view returns (uint256) {
        (, int256 answer, , , ) = priceFeed.latestRoundData();
        
        return uint256(answer * 10000000000);
    }

    
    function getConversionRate(uint256 ethAmount)
        public
        view
        returns (uint256)
    {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1000000000000000000;
        
        return ethAmountInUsd;
    }

    
    modifier onlyOwner() {
        
        require(msg.sender == owner);

        _;
    }

    
    
    
    function withdraw() public payable onlyOwner {
        
        
        payable(msg.sender).transfer(address(this).balance);
        

        
        
        for (
            uint256 funderIndex = 0;
            funderIndex < funders.length;
            funderIndex++
        ) {
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }
        
        funders = new address[](0);
    }
}
