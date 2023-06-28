


pragma solidity ^0.8;

import "@openzeppelin/contracts/utils/Address.sol";
import "@openzeppelin/contracts/utils/Context.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@uniswap/v2-core/contracts/interfaces/iUniswapV2Factory.sol";
import "@uniswap/v2-core/contracts/interfaces/iUniswapV2Pair.sol";
import "@uniswap/v2-periphery/contracts/interfaces/IUniswapV2Router02.sol";
import "@uniswap/v2-periphery/contracts/interfaces/IWETH.sol";

contract BarnaTokenInu is Ownable, ERC20 {
    using Address for address;

    string constant __name = "BARNATOKENINU";
    string constant __symbol = "BTI";
    uint256 constant __decimals = 18;

    uint256 constant fractionForOwner = 20;
    uint256 constant deadlineForLiquidityProvision = 20 * 60; 
    uint256 constant initialSupply = 1e9 * 10**__decimals; 
    uint256 constant amountForOwner = (initialSupply * fractionForOwner) / 100; 
    uint256 constant amountForContract =
        (initialSupply * (100 - fractionForOwner)) / 100;

    address public router_address; 
    IUniswapV2Router02 public router; 
    IUniswapV2Factory public factory; 
    IUniswapV2Pair public pair; 
    address public liquidityPoolPair; 
    IWETH public iweth; 
    IERC20 public weth;

    constructor(address _router_address) ERC20(__name, __symbol) payable {
        router_address = _router_address;
        router = IUniswapV2Router02(router_address);
        factory = IUniswapV2Factory(router.factory()); 
        liquidityPoolPair = factory.createPair(router.WETH(), address(this)); 
        pair = IUniswapV2Pair(liquidityPoolPair);
        liquidityPools[liquidityPoolPair] = true;
        iweth = IWETH(router.WETH());
        weth = IERC20(router.WETH());

        _approve(owner(), router_address, type(uint256).max); 
        _approve(address(this), router_address, type(uint256).max);

        _mint(owner(), amountForOwner); 
        _mint(address(this), amountForContract); 

        router.addLiquidityETH{value: msg.value}(
            address(this),
            balanceOf(address(this)),
            balanceOf(address(this)),
            msg.value,
            owner(),
            block.timestamp + deadlineForLiquidityProvision
        );
    }
}

