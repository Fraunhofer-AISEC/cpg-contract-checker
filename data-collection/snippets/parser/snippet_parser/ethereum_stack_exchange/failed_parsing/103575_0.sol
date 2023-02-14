function startNewPhase(uint256 _tokenPrice, uint256 tokenAmount) public {
require(msg.sender == admin, "Can only be inoked by admin");
require(tokenContract.mint(address(this), tokenAmount));
saleActive = true;
tokenPrice = _tokenPrice;
