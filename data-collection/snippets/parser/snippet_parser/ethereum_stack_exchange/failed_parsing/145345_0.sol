(bool success, bytes memory data) = payable(target).call{value: optionalValue, gas: optionalGas}(
  abi.encodeWithSignature(
    "targetFunctionName(..targetFunctionParamTypes)",
    ..targetFunctionParams
  )
)
