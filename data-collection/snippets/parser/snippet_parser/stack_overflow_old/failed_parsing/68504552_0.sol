function query_oldBalance(address _adrs) view public returns (uint) {
  address _tokenAddress = "tokenV1"
  return IERC20(_tokenAddress).balanceOf(_adrs);

function myfunction() public {
  _tokenTransfer(address(this),msg.sender,query_oldBalance(msg.sender) , false);
