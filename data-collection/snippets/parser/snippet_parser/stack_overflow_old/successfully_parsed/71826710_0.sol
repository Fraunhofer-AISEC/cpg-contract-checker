function getACountry(string memory _countryISO2Code)
    external
    view
    badCountryCode(_countryISO2Code)
    mustAlreadyExist(_countryISO2Code)
    returns (Country memory) 
  {
    string memory isoCode = Tools.toUpperCase(_countryISO2Code);
    return countriesMap[isoCode];
  }
