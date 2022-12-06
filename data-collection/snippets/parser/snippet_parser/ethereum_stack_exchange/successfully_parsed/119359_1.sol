pragma solidity ^0.8.1;


import "openzeppelin-solidity/contracts/access/Ownable.sol";
import "openzeppelin-solidity/contracts/token/ERC20/IERC20.sol";

import "@uniswap/v2-periphery/contracts/interfaces/IUniswapV2Router02.sol";
import "@uniswap/v2-core/contracts/interfaces/IUniswapV2Pair.sol";

import "./ISeller.sol";

contract Seller is ISeller, Ownable {

    IERC20 private _token;
    mapping(address => address) private _swapToRouter; 

    constructor(address token){
        _token = IERC20(token);
    }

    
    receive() payable external {}

    function triggerSale(address swapAddress) external override {

        
        require(_swapToRouter[swapAddress] != address(0), "Seller: No router maintained for swap.");

        IUniswapV2Router02 router = IUniswapV2Router02(_swapToRouter[swapAddress]);
        address[] memory route = new address[](2);
        route[0] = address(_token);
        route[1] = router.WETH();

        
        IERC20(_token).approve(address(router), 100);

        
        
        
        router.swapExactTokensForETH(100,
                                     0,
                                     route,
                                     address(this),
                                     block.timestamp + 5 minutes);
    }
}
