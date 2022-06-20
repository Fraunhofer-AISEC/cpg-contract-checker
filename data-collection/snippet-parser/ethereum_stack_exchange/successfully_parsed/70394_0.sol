pragma solidity >=0.5.6;

contract EventTest {
  event marketCreated(address[] virtualShareAddresses, address market, uint256 indexed endTime, string description, string extraInfo);
  event marketCreated(address[2] virtualShareAddresses, address market, uint256 indexed endTime, string description, string extraInfo);
  event marketCreated(address[2] virtualShareAddresses, address market, uint256 indexed endTime, string description, string extraInfo, int256 _minPrice, int256 _maxPrice, uint256 _numTicks);


  function createYesNoMarket(
    uint256 _endTime,
    string memory _description,
    string memory _extraInfo
    ) public payable returns (bool) 

  {
    address[2] memory virtualShareAddresses;
    address newMarket = address(0);
    virtualShareAddresses[0] = address(1);
    virtualShareAddresses[1] = address(2);
    emit marketCreated(virtualShareAddresses, address(newMarket), _endTime, _description, _extraInfo);
    return true;
  }
}
