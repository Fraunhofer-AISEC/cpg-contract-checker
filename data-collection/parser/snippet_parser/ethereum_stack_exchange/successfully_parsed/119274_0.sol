contract MyDeFiProject {
    
    function supply(address cTokenAddress, uint underlyingAmount ) public {
      CTokenInterface cToken = CTokenInterface(cTokenAddress);
      address underlyingAddress = cToken.underlying(); 

      IERC20(underlyingAddress).approve(cTokenAddress, underlyingAmount);

      uint result = cToken.mint(underlyingAmount); 

      require(
        result == 0, 
        'cToken#mint() failed. see Compound ErrorReporter.sol for details'
      );
    }
}
