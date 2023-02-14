
(bool success, bytes memory returndata) = token.call(abi.encodeWithSignature(IERC20.transfer.selector, to, value));


IERC20(token).transfer(to, value);


require(token.code.size > 0);
(bool success, bytes memory returndata) = token.call(abi.encodeWithSignature(IERC20.transfer.selector, to, value));
require(success);  
