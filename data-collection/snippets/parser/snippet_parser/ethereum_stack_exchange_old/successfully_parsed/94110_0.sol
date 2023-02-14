 function tokTransfer(address payable from, address to, uint256 tokenId, uint256 price, uint256 commission) payable external {
    
    (bool success, ) = from.call{value: price}('');
    require(success, "Transfer failed.");
    (success, ) = address(this).call{value: commission}('');
    require(success, "Transfer failed.");

    this.safeTransferFrom(from, to, tokenId);
 }
