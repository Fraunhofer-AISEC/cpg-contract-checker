struct MintData {
    string seed; 
    string ipfsHash; 
    WorldData worldData;
}

struct WorldData {
    uint256[] geography;
    uint256[] entities; 
    uint256[] resources; 
    uint256[] features; 
}

    
function mintWorld(
    address _to,
    MintData calldata _mintData,
    bytes calldata _signature
) external nonReentrant {
    require(totalSupply() < maxSupply, "No supply remaining");
    require(
        verifyOwnerSignature(keccak256(abi.encode(_mintData)), _signature),
        "Invalid signature"
    );
    uint256 tokenId = totalSupply() + 1;
    seed[tokenId] = _mintData.seed;
    worldData = _mintData.worldData;
    ipfsMetadataHashes[tokenId] = _mintData.ipfsHash;
    _safeMint(_to, tokenId);
}

function verifyOwnerSignature(bytes32 hash, bytes memory signature)
    private
    view
    returns (bool)
{
    return hash.toEthSignedMessageHash().recover(signature) == owner();
}
