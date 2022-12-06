error:browser/delegate.sol:14:31: TypeError: Invalid type for argument in function call. Invalid implicit conversion from bytes4 to bytes memory requested. This function requires a single bytes argument. If all your arguments are value types, you can use abi.encode(...) to properly generate it.
       watch_addr.call(bytes4(keccak256(abi.encode("register(string)"))));
