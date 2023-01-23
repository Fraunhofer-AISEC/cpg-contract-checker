function hashSellOrders(uint256[] memory id, uint256[] memory tokenId, uint256[] memory price, uint256[] memory proto, uint256[] memory purity, address seller) private view returns (bytes32){
    return keccak256(abi.encodePacked(
       "\x19\x01",
       domainSeparator,
       keccak256(abi.encode(
            sellOrdersTypeHash,
            keccak256(abi.encodePacked(id)),
            keccak256(abi.encodePacked(tokenId)),
            keccak256(abi.encodePacked(price)),
            keccak256(abi.encodePacked(proto)),
            keccak256(abi.encodePacked(purity)),
            seller
        ))
    ));
}
