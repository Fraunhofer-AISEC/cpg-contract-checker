contract EventTest {
  
  event marketCreated(address market, uint256 indexed endTime, string description, string extraInfo);
  event marketCreated(address market, uint256 indexed endTime, string description, string extraInfo, int256 _minPrice, int256 _maxPrice, uint256 _numTicks);


  function createYesNoMarket( ...

    emit marketCreated(address(newMarket), _endTime, _description, _extraInfo);

