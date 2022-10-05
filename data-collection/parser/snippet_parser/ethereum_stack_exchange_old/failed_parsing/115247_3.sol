(bool success, bytes memory data) = address(originalContract).call(abi.encodeWithSignature("initialize()"));
