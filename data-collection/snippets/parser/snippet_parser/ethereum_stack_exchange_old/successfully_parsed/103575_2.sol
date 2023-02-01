

pragma solidity ^0.8.0;


import "./Token.sol";

contract Sale {

    address admin;
    Token public tokenContract;
    uint256 public tokenPrice;
    uint256 public tokenSold;
    bool public saleActive;

    event Sell(
        address  _buyer,
        uint256 _amount
    );

    constructor(Token _tokenContract, uint256 _tokenPrice) {
        admin = msg.sender;
        tokenContract = _tokenContract;
        tokenPrice = _tokenPrice;
        saleActive = true;
    }
    
    modifier onlyOwner {
        require(msg.sender == admin, "Can only be inoked by admin");
        _;
    }

    function multiply(uint x, uint y) internal pure returns (uint z) {
        require(y == 0 || (z = x * y) / y == x);
      }

    function buyTokens(uint256 _numberOfTokens) public payable {
        require(saleActive == true, "Sale inactive");
        require(msg.value == multiply(_numberOfTokens, tokenPrice));
        require(tokenContract.balanceOf(address(this)) >= _numberOfTokens, "Not enough tokens for sale");
        require(tokenContract.transfer(msg.sender, _numberOfTokens));

        tokenSold += _numberOfTokens;
        emit Sell(msg.sender, _numberOfTokens);
    }

    function startNewPhase(uint256 _tokenPrice, uint256 tokenAmount) public onlyOwner {
        require(tokenContract.mint(address(this), tokenAmount));
        saleActive = true;
        tokenPrice = _tokenPrice;

    }

    function endSale() public onlyOwner{
        require(tokenContract.transfer(admin, tokenContract.balanceOf(address(this))));
        payable(admin).transfer(address(this).balance);
        saleActive = false;
    }
}
