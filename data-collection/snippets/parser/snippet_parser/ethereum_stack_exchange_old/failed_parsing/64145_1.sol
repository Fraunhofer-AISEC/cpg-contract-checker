Error: Invalid type for argument in function call. Invalid implicit conversion from string memory to bytes memory requested. This function requires a single bytes argument. Use abi.encodePacked(...) to obtain the pre-0.5.0 behaviour or abi.encode(...) to use ABI encoding.
  bytes32 hashedinput = keccak256(input);
                                  ^---^
