function getbasePercent() external view returns(uint256) {
TokenContract a = TokenContract(tokenaddress);
 return  a.basePercent() ;
}
