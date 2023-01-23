
pragma solidity ^0.8.10;

import {IPool} from "@aave/core-v3/contracts/interfaces/IPool.sol";

contract AaveV3 {

     function supply(
        address pool,
        address asset,
        address onBehalfOf,
        uint256 amount
    ) public {
        IPool(pool).supply(asset, amount, onBehalfOf, 0);
        
    }

}
