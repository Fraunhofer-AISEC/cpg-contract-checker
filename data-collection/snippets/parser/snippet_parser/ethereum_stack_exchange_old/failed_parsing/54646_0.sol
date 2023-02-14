bool result = address(contract).call.value(10)(bytes4(keccak256("buyItem(uint256)", _sku)));

bool result = address(contract).call.value(10)(abi.encodeWithSignature("buyItem(uint256)", _sku));
