contract CallbackContract {
  address private callbackContractAddress;
  bytes4 private callbackFunctionSignature;
  constructor(address _callbackContractAddress, bytes4 _callbackFunctionSignature) {
    callbackContractAddress = _callbackContractAddress;
    callbackFunctionSignature = _callbackFunctionSignature;
  }
...
}
