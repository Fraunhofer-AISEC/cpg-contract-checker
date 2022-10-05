contract OracleConsumer {
  address oracle = 0x123...; 
  
  modifier onlyBy(address account) { 
    require(msg.sender == account);  _; 
  }

  event OracleRequest(..., abi encoding of callback function )
  
  function updateExchangeRate() {
    event OracleRequest("USD", ..., "oracleResponse(bytes)" )
  }
    
  function oracleResponse(bytes response) onlyBy(oracle) { 
    
  }
}
