function _transferFrom(address owner, address contract1155, address from, address to, uint256 id, uint256 amount, bytes data) public {

require(msg.sender == owner, "Function could be called by owner only");
IERC1155(contract1155).safeTransferFrom(address from, address to, uint256 id, uint256 amount, bytes data);

}
