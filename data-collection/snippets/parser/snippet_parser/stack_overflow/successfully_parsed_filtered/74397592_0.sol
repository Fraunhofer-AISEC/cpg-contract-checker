using Counters for Counters.Counter;
using ECDSA for bytes32;

Counters.Counter private _tokenIdCounter;
mapping(address => uint256) private userInfo;

bytes32 private constant TYPEHASH =
    keccak256("NFT(EIP712 nftcontract,uint256 tokenId)");

constructor() EIP712("aaa", "1.0.0") {}


function depositNFT(NFT calldata nft, bytes calldata signature) public override returns (bool signerIsOwner)
{
    require(verify(nft, signature));

    uint256 tokenId = _tokenIdCounter.current();
    userInfo[msg.sender] = tokenId;
    _tokenIdCounter.increment();

    return signerIsOwner;
}


function verify(NFT calldata nft, bytes calldata signature) public view returns (bool) {
        address signer = _hashTypedDataV4(
            keccak256(abi.encode(TYPEHASH, nft.nftcontract, nft.tokenId))
        ).recover(signature);

        return true;
    }
