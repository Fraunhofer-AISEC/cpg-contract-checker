pragma solidity ^0.5.0;

import "./SafeMath.sol";
import "./Token.sol";

contract Own {

    address public owner;

    constructor() public {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
}




contract Crowdsale is Own, Token {
    using SafeMath for uint256;

    constructor() public payable{
        rate = 10000000000000000;
        wallet = 0xAa6f0507bF7baaB35E2f0Bb9a318E1D0F61F371b;
    }

    Token public token;
    address payable public wallet;
    uint256 public rate;

    event TokenPurchase(address recipient, uint256 numPaid, uint256 numTokensPurchased);

    function buyTokens() public payable {
        
        uint256 val = msg.value;
        require(msg.sender != address(0));
        require(val > 0);
        uint256 tokenAmount = _getTokenAmount(val);
        require(token.balanceOf(address(this)) >= tokenAmount);
        token.transferFrom(address(this), msg.sender, tokenAmount);
        emit TokenPurchase( msg.sender, val, tokenAmount);
        _forwardFunds();
    }
    
    function () external payable{
        buyTokens();
    }

    function _getTokenAmount(uint256 weiVal) internal returns (uint256) {
        return weiVal * rate;
    }

    function _forwardFunds() internal {
        transferFrom.(address(this), address(wallet), address(this).balance);
    }
}
