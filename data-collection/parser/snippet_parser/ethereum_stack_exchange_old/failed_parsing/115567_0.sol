(bool success, bytes memory returnVal) = addr.call(abi.encodeWithSignature("x()"));
require(success, "Could not call x()");
