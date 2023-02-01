function callOptionalReturn(IERC20 token, bytes memory data) private {
  
  
  
  
  

  require(address(token).isContract(), "SafeERC20: call to non-contract");
  (bool success, bytes memory returndata) = address(token).call(data);

  require(success, "SafeERC20: low-level call failed'");
  if (returndata.length > 0) {
  
  require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
}
