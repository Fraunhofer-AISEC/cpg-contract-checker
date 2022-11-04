
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "./MyTokenERC20.sol";

contract PrivateSales {
    using SafeMath for uint256;    

    MyTokenERC20 public token;
    address public privateSaleAddr      = address(0x0dfdfdfdfdfdf); 
    uint256 public tokensPerEth = 100;

    event Bought(uint256 amount);
    event Sold(uint256 amount);

    constructor(address _token) public {
        token = MyTokenERC20(_token);
    }

    function setAddr(address _token) public {
        token = MyTokenERC20(_token);
    }

    function buyTokens() public payable returns (uint256 tokenAmount) {
        require(msg.value > 0, "Send ETH to buy some tokens");

        uint256 amountToBuy = msg.value * tokensPerEth;

        
        uint256 vendorBalance = token.balanceOf(privateSaleAddr);
        require(vendorBalance >= amountToBuy, "Vendor contract has not enough tokens in its balance");

        
        token.approve(address(this), amountToBuy);
        (bool sent) = token.transfer(msg.sender, amountToBuy);
        require(sent, "Failed to transfer token to user");

        
        

        return amountToBuy;
  }
}
