bytes memory bresult;
bool success;
(success, bresult) = address(this).staticcall(abi.encodeWithSignature(functionName.concat("()")));
