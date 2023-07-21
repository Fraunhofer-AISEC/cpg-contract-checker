
pragma solidity >=0.6.6 <0.9.0;




pragma solidity ^0.8.0;

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

contract FundMe{
    mapping(address => uint256) public AddressToAmountFunded;
    function Fund() public payable{
        AddressToAmountFunded[msg.sender] += msg.value;
    }
    function getVersion() public view returns (uint256){
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x1b44F3514812d835EB1BDB0acB33d3fA3351Ee43);
        return priceFeed.version();

    }
    function getPrice() public view returns (uint256){
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x1b44F3514812d835EB1BDB0acB33d3fA3351Ee43);
        (uint80 roundId,
         int256 answer,
         uint256 startedAt,
         uint256 updatedAt,
         uint80 answeredInRound)
         = priceFeed.latestRoundData();
         return uint256(answer);
    }
}
