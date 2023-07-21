

pragma solidity 0.8.11;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract CLSICO is Ownable {
    
    address payable public wallet;
    uint256 public rate;
    uint256 public weiRaised;
    uint256 public usdtBalance;

    address public constant usdtTokenAddress = 0xdAC17F958D2ee523a2206206994597C13D831ec7; 
    address public constant clsTokenAddress = 0x1D06a839cDE5b669084fA50f210BC004e07d04A1; 

    IERC20 public usdtToken;
    IERC20 public clsToken;

    event TokensPurchased(address indexed purchaser, address indexed beneficiary, uint256 value, uint256 amount);

    constructor(address payable _wallet, uint256 _rate) {
        require(_wallet != address(0), "Invalid wallet address");
        require(_rate > 0, "Invalid rate");
        wallet = _wallet;
        rate = _rate;
        usdtToken = IERC20(usdtTokenAddress);
        clsToken = IERC20(clsTokenAddress);
        usdtBalance = 0;
    }

    function buyTokens(address payable _beneficiary, uint256 usdtAmount) public payable {

        require(_beneficiary != address(0), "Invalid beneficiary address");
        require(usdtAmount > 0, "Invalid amount of USDT");

        
        uint256 clsAmount = usdtAmount * rate;
        
        
        usdtToken.allowance(msg.sender, address(this));
        require(usdtToken.approve(address(this), usdtAmount), "USDT approval failed");
        require(usdtToken.transferFrom(msg.sender, wallet, usdtAmount), "USDT transfer failed");
        usdtBalance += usdtAmount;

        
        clsToken.allowance(wallet, address(this));
        require(clsToken.approve(address(this), clsAmount), "CLS approval failed");
        require(clsToken.transferFrom(wallet, _beneficiary, clsAmount), "CLS transfer failed");

        emit TokensPurchased(msg.sender, _beneficiary, usdtAmount, clsAmount);

    }

    function setRate(uint256 newRate) public onlyOwner {
        require(newRate > 0, "Invalid rate");
        rate = newRate;
    }
    
    function withdrawUSDT(uint256 amount) public onlyOwner {
        require(usdtBalance >= amount, "Insufficient USDT balance");
        require(usdtToken.transfer(wallet, amount), "USDT withdrawal failed");

        
        usdtBalance -= amount;
    }
}
