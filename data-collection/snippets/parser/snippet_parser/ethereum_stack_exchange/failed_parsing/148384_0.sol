  function transferFrom(address sender, address recipient, uint256 amount) 
external returns (bool);
function balanceOf(address account) external view returns (uint256);


constructor(address _tokenAddress, uint _price) {
    tokenAddress = _tokenAddress;
    price = _price;
}

function buy() public {
    IERC20 token = IERC20(tokenAddress);
    uint tokensNeeded = price * 1 ether;
    require(token.balanceOf(msg.sender) >= tokensNeeded, "Insufficient funds");
    require(token.transferFrom(msg.sender, address(this), tokensNeeded), "Token 
  transfer failed");
    
}
 }
