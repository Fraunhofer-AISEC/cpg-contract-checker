




pragma solidity ^0.8.8;

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
contract FundDad {

    uint256 public minimumUsd = 50;

    function fund() public payable{



        require(msg.value > 1e18, "Didn't send enough"); 

    }

    function getPrice() public {



    function getVersion() public view returns (uint256) 
    (   
        AggregatorV3Interface priceFeed = 
AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        return priceFeed.version();
    )


    function getConversionRate() public {}

   


}
