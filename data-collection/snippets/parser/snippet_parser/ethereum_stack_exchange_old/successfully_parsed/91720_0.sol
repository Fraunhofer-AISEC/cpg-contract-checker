fallback() external {        
     (param1, param2) = abi.decode(msg.data[4:], (uint256, uint256));
}
