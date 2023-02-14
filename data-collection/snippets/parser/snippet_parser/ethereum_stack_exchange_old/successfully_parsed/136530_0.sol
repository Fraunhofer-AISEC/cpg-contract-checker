pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "./IPool.sol";

contract AaveTest2 {
    IPool public aavePoolManager = IPool(0x794a61358D6845594F94dc1DB02A252b5b4814aD);
    address public usdc = 0x2791Bca1f2de4661ED88A30C99A7a9449Aa84174;
    address public ausdc = 0x625E7708f30cA75bfd92586e17077590C60eb4cD;
    address public dai = 0x8f3Cf7ad23Cd3CaDbD9735AFf958023239c6A063;
    address public adai = 0x82E64f49Ed5EC1bC6e43DAD4FC8Af9bb3A2312EE;

    uint public totalStakedUSDC;
    uint public totalStakedDAI;

    constructor() {}


    function aaveDepositUSDC(uint amount) public {
        IERC20(usdc).approve(address(aavePoolManager), amount);
        aavePoolManager.supply(usdc, amount, address(this), 0);
        totalStakedUSDC += amount;
    }

    function calculateYieldUSDC() public view returns (uint) {
        uint yield = IERC20(ausdc).balanceOf(address(this)) - totalStakedUSDC;
        return yield;
    }
    
    function withdrawYieldUSDC() public {
        uint yield = calculateYieldUSDC();
        aavePoolManager.withdraw(usdc, yield, address(this));
    }

    function withdrawUSDC(uint amount) public {
        aavePoolManager.withdraw(usdc, amount, address(this));
        totalStakedUSDC -= amount;
    }

    function aaveDepositDAI(uint amount) public {
        IERC20(dai).approve(address(aavePoolManager), amount);
        aavePoolManager.supply(dai, amount, address(this), 0);
        totalStakedDAI += amount;
    }

    function calculateYieldDAI() public view returns (uint) {
        uint yield = IERC20(adai).balanceOf(address(this)) - totalStakedDAI;
        return yield;
    }
    
    function withdrawYieldDAI() public {
        uint yield = calculateYieldDAI();
        aavePoolManager.withdraw(dai, yield, address(this));
    }

    function withdrawDAI(uint amount) public {
        aavePoolManager.withdraw(dai, amount, address(this));
        totalStakedDAI -= amount;
    }
}
