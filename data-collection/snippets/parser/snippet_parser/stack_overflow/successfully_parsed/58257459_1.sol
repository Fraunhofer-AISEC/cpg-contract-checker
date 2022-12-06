string private constant domain = "EIP712Domain(string name,string version,uint256 chainId,address verifyingContract,bytes32 salt)";
bytes32 public constant domainTypeHash = keccak256(abi.encodePacked(domain));
string private constant sellOrdersType = "SellOrders(uint256[] id,uint256[] tokenId,uint256[] price,uint256[] proto,uint256[] purity,address seller)";
bytes32 public constant sellOrdersTypeHash = keccak256(abi.encodePacked(sellOrdersType));
uint256 constant chainId = 3;
bytes32 constant salt = 0xa222082684812afae4e093416fff16bc218b569abe4db590b6a058e1f2c1cd3e;
bytes32 private domainSeparator;

struct SellOrders {
    uint256[] id;
    uint256[] tokenId;
    uint256[] price;
    uint256[] proto;
    uint256[] purity;
    address payable seller;
}

constructor() public {
    domainSeparator = keccak256(abi.encode(
        domainTypeHash,
        keccak256("app"),
        keccak256("1"), 
        chainId,
        this,
        salt
    ));
}

function recover(uint256[] calldata id, uint256[] calldata tokenId, uint256[] calldata price, uint256[] calldata proto, uint256[] calldata purity, address seller, uint8 v, bytes32 r, bytes32 s) external view returns (address) {
    return _recover(id, tokenId, price, proto, purity, seller, v, r, s);
}
function _recover(uint256[] memory id, uint256[] memory tokenId, uint256[] memory price, uint256[] memory proto, uint256[] memory purity, address seller, uint8 v, bytes32 r, bytes32 s) private view returns (address) {
    return ecrecover(hashSellOrders(id, tokenId, price, proto, purity, seller), v, r, s);
}
function hashSellOrders(uint256[] memory id, uint256[] memory tokenId, uint256[] memory price, uint256[] memory proto, uint256[] memory purity, address seller) private view returns (bytes32){
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
