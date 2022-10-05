function exec (bytes calldata params) external{
            (bytes memory swap_data,address token, uint256 amount) = abi.decode(params, (bytes, address,uint256)); 
            IERC20(token).approve(AGGREGATION_ROUTER_V4, amount);      
            (bool succ,) = address(AGGREGATION_ROUTER_V4).call(swap_data);     
            require(succ, "Failed to swap" );
    }
