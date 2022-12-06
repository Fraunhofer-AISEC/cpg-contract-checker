function buy(address token, address to, uint256 amount) {
 if(token == address(0)) {
   to.call{value : amount}();
 }else {
   ERC20(token).transferFrom(msg.sender, to, amount);
 }
}
