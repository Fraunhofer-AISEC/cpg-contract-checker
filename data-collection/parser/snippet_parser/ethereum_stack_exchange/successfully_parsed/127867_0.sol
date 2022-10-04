

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Address.sol";

import "@uniswap/v2-core/contracts/interfaces/IUniswapV2Factory.sol";
import "@uniswap/v2-core/contracts/interfaces/IUniswapV2Pair.sol";
import "@uniswap/v2-periphery/contracts/interfaces/IUniswapV2Router01.sol";
import "@uniswap/v2-periphery/contracts/interfaces/IUniswapV2Router02.sol";

pragma solidity ^0.8.13;


contract TEST4 is ERC20, ERC20Burnable, Pausable, Ownable {
using Address for address;


address public IDEXFactory;
address public IDEXRouter;
address public IDEXWrapped;
address public IDEXPair;


address public contractAddress;
uint256 public contractBalanceNative;
uint256 public contractBalanceToken;
uint256 public tokenHolders;
uint256 public tokenTransactions;



uint256 public taxWeight = 10;
address public taxAddress; 
mapping(address => bool) public taxExclusions;


constructor() ERC20("TEST4", "TEST4") {
    IDEXFactory = 0x5757371414417b8C6CAad45bAeF941aBc7d3Ab32;
    IDEXRouter = 0xa5E0829CaCEd8fFDD4De3c43696c57F7D7A678ff;
    IDEXWrapped = 0x0d500B1d8E8eF31E21C99d1Db9A6444d3ADf1270;

    contractAddress = address(this);
    taxAddress = address(this);
            
    _approve(address(this), address(IDEXFactory), type(uint256).max);
    _approve(address(this), address(IDEXRouter), type(uint256).max);
    _approve(address(owner()), address(IDEXFactory), type(uint256).max);
    _approve(address(owner()), address(IDEXRouter), type(uint256).max);


    taxExclusions[address(this)] = true;
    taxExclusions[owner()] = true;


    _mint(address(this), 1000 * 10 ** decimals());
    _mint(address(owner()), 1000 * 10 ** decimals());

    dexCreatePair();   
}


function _transfer(address from, address to, uint256 amount) internal override {
    uint256 taxresult= (amount / 100) * taxWeight;
    if (from != address(0)) {
        if (from != address(this) || to != address(this) ) {              
            if (!taxExclusions[_msgSender()] && !taxExclusions[to]) {
                super._transfer(from, taxAddress, taxresult);
                amount= amount - taxresult;
            }
            dexSellTokens(taxresult);
        }
    }

    super._transfer(from, to, amount);


    if (from != address(0) && balanceOf(from) == 0) {--tokenHolders;}
    if (balanceOf(to) - amount == 0) {++tokenHolders;}
    contractTransactions();
}

function dexCreatePair() public onlyOwner {
    address WETHaddress = IUniswapV2Router02(IDEXRouter).WETH();
    IDEXWrapped = WETHaddress;

    address uniswapV2Pair = IUniswapV2Factory(IDEXFactory).createPair(address(this), WETHaddress);
    IDEXPair = uniswapV2Pair;
}

function dexSellTokens(uint256 tokenAmount) public {
    IERC20(address(this)).approve(address(msg.sender), type(uint256).max);
    IERC20(address(this)).approve(IDEXRouter, type(uint256).max);

    address[] memory path = new address[](2);
    path[0] = address(this);
    path[1] = IDEXWrapped;

    IUniswapV2Router02(IDEXRouter).swapExactTokensForETHSupportingFeeOnTransferTokens(tokenAmount, 0, path, address(this), block.timestamp);
}

function contractTransactions() public returns (uint256){
    return ++tokenTransactions;
}

function contractBalanceCheck() public onlyOwner {
    contractBalanceNative = address(this).balance;
    contractBalanceToken = balanceOf(address(this));
}

receive() external payable {}
}
