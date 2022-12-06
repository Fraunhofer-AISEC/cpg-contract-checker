pragma solidity ^0.4.2;

import "./DappToken.sol";

contract DappTokenSale {
    address admin;
    DappToken public tokenContract;
    uint256 public tokenPrice;
    uint256 public tokensSold;
    uint256 public decimals;


    event Sell(address _buyer, uint256 _amount);

    function DappTokenSale(DappToken _tokenContract, uint256 _tokenPrice) public {
        admin = msg.sender;
        tokenContract = _tokenContract;
        tokenPrice = _tokenPrice;
    }

    function multiply(uint x, uint y) internal pure returns (uint z) {
        require(y == 0 || (z = x * y) / y == x);
    }

    function buyTokens(address _receiver, uint256 _amount) public payable {
        _amount = msg.value;
        require(_receiver != address(0));
        require(_amount > 0);
        uint256 tokensToBuy = multiply(_amount, (10 ** decimals)) / 1 ether * tokenPrice;
        require(tokenContract.transfer(msg.sender, tokensToBuy));
        tokensSold += _amount;

        emit Sell(msg.sender, tokensToBuy);
    }

  
    function endSale() public {
            
            require (msg.sender == admin);

             
            require(tokenContract.transfer(admin,tokenContract.balanceOf(this)));


            
            selfdestruct(admin);
    }
}
