IERC20 token;
uint256 airdropAmount;
mapping(address => bool) public redeemed;

function redeem(address to) external {
 require(!redeemed[to], "already redeemed");
 require(!redeemed[msg.sender], "already redeemed");
 redeemed[msg.sender] = true;
 redeemed[to] = true;
 token.transfer(to, airdropAmount);
}
