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


contract PriceConverter {

        address public priceSource;
        address public quote;
        uint8 private decimals;
       
        


        uint256 public fallbackPrice;

    event FallbackPrice(
         uint80 roundId, 
         int256 answer,
         uint256 startedAt,
         uint256 updatedAt, 
         uint80 answeredInRound
         );

 constructor(address _priceSource, address _quote, uint8 _decimals) public {
        priceSource = _priceSource;
        quote  = _quote;
        decimals =  uint8(10 ** uint8(_decimals));
        
    }

   function latestRoundData() public view
        returns 
            (uint80 roundId,
             int256 answer,
             uint256 startedAt,
             uint256 updatedAt, 
             uint80 answeredInRound
            )
            
    {
       

        require(decimals > uint8(0) && decimals <= uint8(18), "Invalid _decimals");
       
        ( , int256 basePrice, , , ) = address(priceSource).latestRoundData();
        uint8 baseDecimals = address(priceSource).decimals();
        basePrice = scalePrice(basePrice, baseDecimals, decimals);

        ( , int256 quotePrice, , , )  = address(quote).latestRoundData();
        uint8 quoteDecimals = address(quote).decimals();
        quotePrice = scalePrice(quotePrice, quoteDecimals, decimals);

         return basePrice * decimals / quotePrice;
         

        
    }



function updateFallbackPrice() public {
        (
         uint80 roundId, 
         int256 answer,
         uint256 startedAt,
         uint256 updatedAt, 
         uint80 answeredInRound
         ) = priceSource.latestRoundData();

        if (answer > 0) {
            fallbackPrice = uint256(answer);
            emit FallbackPrice(roundId,answer,startedAt,updatedAt,answeredInRound);
        }
    }


    function scalePrice(int256 _price, uint8 _priceDecimals, uint8 _decimals)
        internal
        pure
        returns (int256)
    {
        if (_priceDecimals < _decimals) {
            return _price * int256(10 ** uint256(_decimals - _priceDecimals));
        } else if (_priceDecimals > _decimals) {
            return _price / int256(10 ** uint256(_priceDecimals - _decimals));
        }
        return _price;
    }
} ```


Also i added screenshot of what it looks like on remix IDE




  [1]: https:
