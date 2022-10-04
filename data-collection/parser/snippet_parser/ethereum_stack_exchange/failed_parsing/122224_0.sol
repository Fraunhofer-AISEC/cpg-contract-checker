pragma solidity ^0.8.12;
    
    import "./pSDAToken.sol";
    
    contract pSDATokenSale {
        address admin;
        pSDATokenSale public tokenContract;
        uint256 public tokenPrice;
        uint256 public tokensSold;
    
        event Sell(address _buyer, uint256 _amount);
    
        function pSDAToken(pSDATokenSale _tokenContract, uint256 _tokenPrice)
            public
        {
            admin = msg.sender;
            tokenContract = _tokenContract;
            tokenPrice = _tokenPrice;
        }
    
        function multiply(uint256 x, uint256 y) internal pure returns (uint256 z) {
            require(y == 0 || (z = x * y) / y == x);
        }
    
        function buyTokens(uint256 _numberOfTokens) public payable {
            require(msg.value == multiply(_numberOfTokens, tokenPrice));
            require(tokenContract.balanceOf(this) >= _numberOfTokens);
            require(tokenContract.transfer(msg.sender, _numberOfTokens));
