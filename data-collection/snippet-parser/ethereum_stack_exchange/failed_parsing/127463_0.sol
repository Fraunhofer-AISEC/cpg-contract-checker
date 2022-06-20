bytes memory returndata = address(token).functionCall(data, "SafeERC20: low-level call failed");
if (returndata.length > 0) {
    
    require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
}
