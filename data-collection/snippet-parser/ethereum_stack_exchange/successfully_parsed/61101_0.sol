  function queryString(
    uint256 _dynamicVariable
  ) 
    internal
    returns (string)
  {
    return strConcat(
      apiPrefix, 
      encryptedApiComponent, 
      "}", 
      uint2str(_dynamicVariable), 
      apiSuffix
    );
  }
