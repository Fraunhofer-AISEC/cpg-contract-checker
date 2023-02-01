
pragma solidity ^0.7.3;

import {IERC20} from "../aave-flashloan/interfaces/IERC20.sol";
import {FlashloanProvider2} from "./FlashloanProvider.sol";
import {IFlashloanUser2} from "./IFlashloanUser.sol";

contract FlashloanUser2 is IFlashloanUser2 {
    string public output1;
    string public output2;

    
    function startFlashloan(
        address flashloan,
        uint256 amount,
        address token
    ) external {
       
        FlashloanProvider2(flashloan).executeFlashloan(
            address(this),
            amount,
            token,
            'flash1',
            1
        );
        
        FlashloanProvider2(flashloan).executeFlashloan(
            address(this),
            amount,
            token,
            'flash2',
            2
        );
    }

    
    function flashloanCallback(
        uint256 amount,
        address token,
        string memory data,
        uint256 flashNumber
    ) external override {
        
        if (flashNumber == 1) {
            output1 = data;
        } else {
            output2 = data;
        }

        
        IERC20(token).transfer(msg.sender, amount);
    }
}
