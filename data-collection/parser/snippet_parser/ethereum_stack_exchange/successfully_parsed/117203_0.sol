function onERC721Received(
        address,
        address from,
        uint256 tokenId,
        bytes calldata data
    ) external returns (bytes4) {

        uint256 duration = bytesToUintDuration(data) * 1 days;
        uint256 amount = bytesToUintAmount(data) * 1 days;
    }
