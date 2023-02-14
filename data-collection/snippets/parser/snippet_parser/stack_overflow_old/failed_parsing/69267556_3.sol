(bool success, bytes memory data) = IMasterchef(masterchef).delegatecall(abi.encodeWithSignature("harvest(uint256,address)",i,_user));
