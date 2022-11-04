pragma solidity ^0.8.0;


import '@uniswap/v2-periphery/contracts/interfaces/IUniswapV2Router02.sol';     
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import '@uniswap/v2-core/contracts/interfaces/IUniswapV2Factory.sol';


contract CoinX is ERC20 {
    constructor(uint256 initialSupply) ERC20("CoinX", "CNX") {
        _mint(msg.sender, initialSupply);
    }
}
