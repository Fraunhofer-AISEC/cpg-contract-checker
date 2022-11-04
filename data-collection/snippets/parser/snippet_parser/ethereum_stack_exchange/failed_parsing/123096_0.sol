pragma solidity ^0.8.0;

import "./IERC20.sol"; 


contract Swap {

    address private constant Paraswap = 
    address private constant ParaswapProxy = 

    function swapIt(
        address _token1,
        uint _amount1,
        bytes calldata _swapdata1,
        address _token2,
        uint _amount2,
        bytes calldata _swapdata2
        ) external {

            IERC20(_token1).transferFrom(msg.sender, address(this), _amount1);

            IERC20(_token1).approve(ParaswapProxy, _amount1);
            (bool success1, ) = Paraswap.call(_swapdata1);
            require(success1, 'Failed at one');

            IERC20(_token2).approve(ParaswapProxy, _amount2);
            (bool success2, ) = Paraswap.call(_swapdata2);
            require(success2, 'Failed at two');

            IERC20(_token2).transferFrom(address(this), msg.sender, _amount2);
        }
         
    
}

