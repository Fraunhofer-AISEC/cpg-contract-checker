bytes memory transferPayload = abi.encodeWithSelector(bytes4(0xbeabacc8), param1, param2, param3);
bytes memory executePayload = abi.encodeWithSignature("execute(address,bytes)", transferContractAdr, transferPayload);
(bool success, bytes memory returnData) = address(executeContractAdr).call(executePayload);
require(success, "low-level call of function execute failed [transfer(address,address,uint256), param1, param2, param3]");
