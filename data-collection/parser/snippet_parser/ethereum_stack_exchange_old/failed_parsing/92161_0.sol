uint256 public balance;  
address public payable recipient;

function transferOnePercentage() public payable returns (bool) {
   ERC20token.transfer(recipient, balance * 1 / 100);
   return true;
}
