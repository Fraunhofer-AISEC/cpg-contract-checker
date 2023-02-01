(bool success, bytes memory data) = address(originalContract).call{gas:7000}(abi.encodeWithSignature("initialize()"));
