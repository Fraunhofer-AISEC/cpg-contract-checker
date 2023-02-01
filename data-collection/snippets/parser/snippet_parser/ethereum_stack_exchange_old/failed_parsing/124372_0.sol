contract Treasury{
 ...............
 fallback() payable{
   uint256 sentByUser = msg.value;
   uint256 requiredTokenAmount = <***your calculation logic***>
   IERC(tokenAddress).transfer(msg.sender, requiredTokenAmount);
   emit <***your event***>;
 }
 ................
}
