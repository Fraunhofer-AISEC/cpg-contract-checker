
pragma solidity ^0.8.9;
pragma experimental ABIEncoderV2;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "./IBPool.sol";
import "./IVault.sol";






contract BalancerOperator is IVault {
    
    function addLiquidity(
        address vaultAddr,
        bytes32 poolId,
        address[] calldata assets,
        uint256[] calldata maxAmountsIn
    ) external {
        uint256 oneUint256 = 1;
        bytes memory userDataEncoded = abi.encode(oneUint256, maxAmountsIn, oneUint256); 
        JoinPoolRequest memory InRequest = JoinPoolRequest(assets, maxAmountsIn, userDataEncoded, false);
        IVault(vaultAddr).joinPool(poolId, msg.sender, msg.sender, InRequest);
    }

    
    function removeLiquidity(
        address vaultAddr,
        bytes32 poolId,
        address[] calldata assets,
        uint256[] calldata minAmountsOut
    ) external {
        uint256 oneUint256 = 1;
        bytes memory userDataEncoded = abi.encode(oneUint256, minAmountsOut, oneUint256); 
        ExitPoolRequest memory OutRequest = ExitPoolRequest(assets, minAmountsOut, userDataEncoded, false);
        IVault(vaultAddr).exitPool(poolId, msg.sender, payable(msg.sender), OutRequest);
    }

    function exchangeTokens(
        
        address vaultAddr,
        bytes32 poolId,
        address tokenInAddress,
        uint256 maxAmountIn,
        address tokenOutAddress
    ) external {
        uint256 oneUint256 = 1;
        
        

        

        bytes memory userDataEncoded = abi.encode(oneUint256, maxAmountIn, oneUint256); 
        SingleSwap memory SingleSwapRequest = SingleSwap(
            poolId,
            SwapKind.GIVEN_OUT,
            tokenInAddress,
            tokenOutAddress,
            maxAmountIn,
            userDataEncoded
        );
        FundManagement memory FundManagementRequest = FundManagement(msg.sender, false, payable(msg.sender), false);
        IVault(vaultAddr).swap(SingleSwapRequest, FundManagementRequest, maxAmountIn, (block.timestamp + 3 minutes));

        
    }

    
}
