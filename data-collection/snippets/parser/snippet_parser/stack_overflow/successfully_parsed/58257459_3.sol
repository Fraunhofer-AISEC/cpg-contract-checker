string private constant sellOrdersType = "SellOrders(uint256 id,uint256 tokenId,uint256 price,uint256 proto,uint256 purity,address seller)";

struct SellOrders {
    uint256 id;
    uint256 tokenId;
    uint256 price;
    uint256 proto;
    uint256 purity;
    address payable seller;
}

function recover(uint256 id, uint256 tokenId, uint256 price, uint256 proto, uint256 purity, address seller, uint8 v, bytes32 r, bytes32 s) external view returns (address) {
    return _recover(id, tokenId, price, proto, purity, seller, v, r, s);
}
function _recover(uint256 id, uint256 tokenId, uint256 price, uint256 proto, uint256 purity, address seller, uint8 v, bytes32 r, bytes32 s) private view returns (address) {
    return ecrecover(hashSellOrders(id, tokenId, price, proto, purity, seller), v, r, s);
}
function hashSellOrders(uint256 id, uint256 tokenId, uint256 price, uint256 proto, uint256 purity, address seller) private view returns (bytes32){
    return keccak256(abi.encodePacked(
       "\x19\x01",
       domainSeparator,
       keccak256(abi.encode(
            sellOrdersTypeHash,
            id,
            tokenId,
            price,
            proto,
            purity,
            seller
        ))
    ));
}
