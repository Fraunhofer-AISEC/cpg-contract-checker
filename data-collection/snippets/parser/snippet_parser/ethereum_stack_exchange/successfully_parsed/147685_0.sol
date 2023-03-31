
pragma solidity 0.8.15;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v4.5/contracts/token/ERC20/IERC20.sol";

contract TokenSale {
    address public admin;
    IERC20 public token;
    uint256 public tokenPrice;
    uint256 public tokensSold;
    uint256 public feePercent;
    address public feeAddress;

    event Sell(address indexed _buyer, uint256 _amount);

    constructor(IERC20 _token, uint256 _tokenPrice,uint256 _feePercent,address _feeAddress) {
        admin = msg.sender;
        token = _token;
        tokenPrice = _tokenPrice;
        feePercent = _feePercent;
        feeAddress = _feeAddress;
    }

    function buyTokens(uint256 _numberOfTokens) public payable {
        uint256 pricePerToken = tokenPrice;
        uint256 totalFee = (_numberOfTokens * feePercent)/100;
        uint256 totalAmount = (_numberOfTokens-totalFee)* pricePerToken;

        require(msg.value >= totalAmount, "Invalid amount of ether sent");
        require(token.balanceOf(address(this)) >= _numberOfTokens, "Insufficient tokens in contract");
        require(token.transfer(msg.sender, _numberOfTokens-totalFee), "Token transfer failed");
        require(token.transfer(feeAddress, totalFee),"Token transfer failed");
        tokensSold += _numberOfTokens;
        emit Sell(msg.sender, _numberOfTokens);
    }
    
    function sellTokens(uint256 _numberOfTokens) public payable{
        uint256 pricePerToken = tokenPrice;
        uint256 totalFee = (_numberOfTokens * feePercent)/100;
        uint256 totalAmount = (_numberOfTokens - totalFee) * pricePerToken;
        
        require(token.balanceOf(msg.sender) >= _numberOfTokens, "Insufficient tokens balance");
        require(address(this).balance >= totalAmount, "Contract has insufficient ether balance");
        require(token.transferFrom(msg.sender, address(this), _numberOfTokens), "Token transfer failed");
        require(token.transfer(feeAddress, totalFee), "Token transfer failed");
        payable(msg.sender).transfer(totalAmount);

        tokensSold += _numberOfTokens - totalFee;
        emit Sell(msg.sender, _numberOfTokens - totalFee);
    }


    function endSale() public payable{
        require(msg.sender == admin, "Only admin can end sale");
        require(token.transfer(admin, token.balanceOf(address(this))), "Token transfer failed");
        payable(admin).transfer(address(this).balance);
    }
}
