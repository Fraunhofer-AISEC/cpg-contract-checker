function sendETHER(address payable to) public payable {
    (bool sent,) = to.call{value: msg.value}("");
    require(sent, "Failed to send Ether");
}

function swapBatch(IERC1155 contractAddy, address from, address to, uint256[] calldata nftIDs, uint256[] calldata nftValues, bytes calldata data, address payable tothem) public payable {
    contractAddy.safeBatchTransferFrom(from, to, nftIDs, nftValues, data);
    sendETHER(tothem);
}
