pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

interface IUniswapV2Router {
    function addLiquidityETH(
        address token,
        uint256 amountTokenDesired,
        uint256 amountTokenMin,
        uint256 amountETHMin,
        address to,
        uint256 deadline
    ) external payable returns (uint256 amountToken, uint256 amountETH, uint256 liquidity);
}

contract PowellCoin is ERC20, ERC20Burnable, Ownable {
    using SafeMath for uint256;

    address public buybackAddress;
    IUniswapV2Router public router;
    address public liquidityPoolAddress;

    constructor(address _router) ERC20("Powell Coin", "PJAY") {
        _mint(msg.sender, 100000000000 * 10 ** decimals());
        buybackAddress = address(0x4Eb45B836e2d0Dd255EC3A5977d1909096960748); 
        router = IUniswapV2Router(_router);
    }

    function transfer(address recipient, uint256 amount) public virtual override returns (bool) {
        _transfer(_msgSender(), recipient, amount);
        _applyFees(amount);
        return true;
    }

    function transferFrom(address sender, address recipient, uint256 amount) public virtual override returns (bool) {
        _transfer(sender, recipient, amount);
        _applyFees(amount);
        _approve(sender, _msgSender(), allowance(sender, _msgSender()) - amount);
        return true;
    }

    function _applyFees(uint256 amount) internal {
        uint256 totalFee = (amount * 5) / 100; 
        uint256 liquidityFee = (amount * 3) / 100; 
        uint256 buybackFee = (amount * 2) / 100; 

        _transfer(_msgSender(), address(this), totalFee); 
        _transfer(address(this), buybackAddress, buybackFee); 

        
        _approve(address(this), address(router), liquidityFee);
        
        uint256 initialBalance = address(this).balance;
        router.addLiquidityETH{value: liquidityFee}(
            address(this),
            liquidityFee,
            0,
            0,
            address(this),
            block.timestamp
        );
        
        uint256 ethGained = address(this).balance.sub(initialBalance);
        if (ethGained > 0) {
            payable(liquidityPoolAddress).transfer(ethGained);
        }
        
        
    }

    function setBuybackAddress(address _buybackAddress) external onlyOwner {
        buybackAddress = _buybackAddress;
    }

    function setRouter(address _router) external onlyOwner {
        router = IUniswapV2Router(_router);
    }
    
    function setLiquidityPoolAddress(address _liquidityPoolAddress) external onlyOwner {
        liquidityPoolAddress = _liquidityPoolAddress;
    }
    
    function getRouterAddress() public view returns (address) {
        return address(router);
    }

    function getLiquidityPoolAddress() public view returns (address) {
        return liquidityPoolAddress;
    }

    
    function renounceOwnership() public override onlyOwner {
        revert("Cannot renounce ownership");
    }

    
    function transferOwnership(address newOwner) public override onlyOwner {
        revert("Ownership transfer not allowed");
    }
}
