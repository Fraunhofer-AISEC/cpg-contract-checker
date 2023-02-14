contract Verifier {


  
  function validate(bytes32 hash, bytes signature)
  public
  pure
  returns (address){
      bytes memory signedString = signature;
      bytes32  r = convertToBytes32(slice(signedString, 0, 32));
      bytes32  s = convertToBytes32(slice(signedString, 32, 32));
      byte  v1 = slice(signedString, 64, 1)[0];
      uint8 v = uint8(v1) + 27;
      return ecrecover(hash, uint8(r), s, bytes32(v));
  }

  
  function slice(bytes memory data, uint start, uint len)
  private
  pure
  returns (bytes){
      bytes memory b = new bytes(len);
      for(uint i = 0; i < len; i++){
          b[i] = data[i + start];
      }
      return b;
  }
  
  function convertToBytes32(bytes memory source)
  private
  pure
  returns (bytes32 result) {
      assembly {
          result := mload(add(source, 32))
      }
  }
}
