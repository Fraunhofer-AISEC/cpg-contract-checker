
   
   
   
   
   
   
   
   
   
   
   
   function mintToken(address token, uint64 amount, bytes[] memory metadata) internal
       returns (int responseCode, uint64 newTotalSupply, int64[] memory serialNumbers)
   {
       (bool success, bytes memory result) = precompileAddress.call(
           abi.encodeWithSelector(IHederaTokenService.mintToken.selector,
           token, amount, metadata));
       (responseCode, newTotalSupply, serialNumbers) =
           success
               ? abi.decode(result, (int32, uint64, int64[]))
               : (HederaResponseCodes.UNKNOWN, 0, new int64[](0));
   }
