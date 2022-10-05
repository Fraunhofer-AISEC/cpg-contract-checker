pragma solidity >=0.6.0 <0.9.0;



interface AggregatorV3Interface {
  function decimals() external view returns (uint8);

  function description() external view returns (string memory);

  function version() external view returns (uint256);

  
  
  
  function getRoundData(uint80 _roundId)
    external
    view
    returns (
      uint80 roundId,
      int256 answer,
      uint256 startedAt,
      uint256 updatedAt,
      uint80 answeredInRound
    );

  function latestRoundData()
    external
    view
    returns (
      uint80 roundId,
      int256 answer,
      uint256 startedAt,
      uint256 updatedAt,
      uint80 answeredInRound
    );
}

contract FundMe {

    
    mapping(address => uint256) public addressToAmmountFunded;

    address public owner;

    
    constructor() {
    
      owner = msg.sender;
    }

    function fund() public payable {
        uint256 minimunUSD = 500 * 10 ** 18; 
        require(getConversionRate(msg.value) >= minimunUSD, "You need to invest more than 500USD in xxx tokens!"); 
        addressToAmmountFunded[msg.sender] += msg.value;
        
    }

    function getVersion() public view returns (uint256){
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e); 
        return priceFeed.version();
    }

    function getPrice() public view returns(uint256){
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
        (,int256 answer,,,) = priceFeed.latestRoundData(); 
         return uint256(answer * 10000000000);
    }

    function getLatestUpdate() public view returns(uint256){
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
        (,,,uint256 updatedAt,) = priceFeed.latestRoundData(); 
         return updatedAt;
    }
    
    function getConversionRate(uint256 ethAmount) public view returns(uint256){
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1000000000000000000 ; 
        return ethAmountInUsd;
    }

    
    modifier onlyOwner {
      require(msg.sender == owner);
      _;
    }
    
    function withdraw() payable onlyOwner public {
      msg.sender.transfer(address(this).balance);
    }
}
