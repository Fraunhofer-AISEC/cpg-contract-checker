  
  function storeABatchOfCountries(string[6][10] calldata countriesData)
    external
    isOwner
  {
    uint8 _countryCounter;
    for (uint256 i = 0; i < countriesData.length; i++) {
      countriesMap[countriesData[i][5]] = Country(
        countriesData[i][0],
        countriesData[i][1],
        countriesData[i][2],
        countriesData[i][3],
        countriesData[i][4],
        countriesData[i][5],
        true
      );
      _countryCounter++;
    }
    numberOfCountries = _countryCounter;
  }
