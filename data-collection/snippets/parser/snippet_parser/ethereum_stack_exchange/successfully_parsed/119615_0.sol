struct ApproveRequest {
    address to;
    uint256 tokenId;
}

function approveMany(ApproveRequest[] memory tokens) external whenNotPaused {
    for (uint32 i=0; i < tokens.length; i++) {
        ApproveRequest memory token = tokens[i];
        approve(token.to, token.tokenId);
    }
}
