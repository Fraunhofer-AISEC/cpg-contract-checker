E       brownie.exceptions.VirtualMachineError: revert: Index out of range
E       Trace step -1, program counter 3546:
E         File "contracts/StakingMonitor.sol", lines 173-178, in StakingMonitor.swapEthForDAI:    
E           uint[] memory tokenAmount_;
E       
E           
E           tokenAmount_ = uniswap.swapExactETHForTokens{value: amount}(
E               0,
E               path,
E               address(this),
E               block.timestamp
E           );
E           uint256 outputTokenCount = uint256(
E               tokenAmount_[tokenAmount_.length - 1]
E           );
