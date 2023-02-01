

pragma solidity ^0.8.0;
import {SAMToken} from './SAMToken.sol';

contract SAMTokenSale { 
    address admin;
    SAMToken public tokenContract;
    uint public tokenPrice;
    uint public tokenSold;
    uint tokensForSale = 100; 

    event Sell(address _address, uint _amount);

    constructor(SAMToken _tokenContract, uint _tokenPrice){
        admin = msg.sender;
        tokenContract = _tokenContract;
        tokenPrice = _tokenPrice;
        tokenContract.transfer(address(this), tokensForSale);  
    }

    function buyTokens(uint _tokenAmount) external payable {
        require(msg.value == tokenPrice * _tokenAmount);
        require(_tokenAmount <= tokenContract.balanceOf(address(this)),'not enough tokens left for sale');
        require(tokenContract.transfer(msg.sender, _tokenAmount)); 
        
        tokenSold +=_tokenAmount;

        emit Sell(msg.sender, _tokenAmount);
    }

    function endSale() external onlyAdmin() {
        
        
        tokenContract.transfer(admin, tokenContract.balanceOf(address(this)));

        
        selfdestruct(payable(admin));
    }

    modifier onlyAdmin(){
        require(msg.sender == admin, 'only admin can do this');
        _;
    }

}
