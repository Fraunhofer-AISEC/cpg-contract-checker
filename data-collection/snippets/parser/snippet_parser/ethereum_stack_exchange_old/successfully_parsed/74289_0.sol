BusinessHash[] public businessHashes;
ProductionHash[] public productionHashes;
DistributionHash[] public distributionHashes;
ShopHash[] public shopHashes;

struct BusinessHash{
    bytes32 hashPart1;
    bytes32 hashPart2;
}

struct ProductionHash{
    bytes32 hashPart1;
    bytes32 hashPart2;
} 

struct DistributionHash{
    bytes32 hashPart1;
    bytes32 hashPart2;
}

struct ShopHash{
    bytes32 hashPart1;
    bytes32 hashPart2;
}


function insertBusinessHash(bytes32 _hashPart1, bytes32 _hashPart2) public{
    BusinessHash memory newBusinessHash;

    newBusinessHash.hashPart1 = _hashPart1;
    newBusinessHash.hashPart2 = _hashPart2;

    businessHashes.push(newBusinessHash);
}


function getBusinessHashes() public view returns (bytes32[] memory, bytes32[] memory){
    uint length = businessHashes.length;

    bytes32[] memory hash1 = new bytes32[](length);
    bytes32[] memory hash2 = new bytes32[](length);


    for(uint i=0; i<businessHashes.length; i++){
        BusinessHash memory currentBusinessHash;
        currentBusinessHash = businessHashes[i];
        hash1[i] = currentBusinessHash.hashPart1;
        hash2[i] = currentBusinessHash.hashPart2;
    }

    return (hash1, hash2);
}


function insertProductionHash(bytes32 _hashPart1, bytes32 _hashPart2) public{
    ProductionHash memory newProductionHash;

    newProductionHash.hashPart1 = _hashPart1;
    newProductionHash.hashPart2 = _hashPart2;

    productionHashes.push(newProductionHash);
}


function getProductionHashes() public view returns (bytes32[] memory, bytes32[] memory){
    uint length = productionHashes.length;

    bytes32[] memory hash1 = new bytes32[](length);
    bytes32[] memory hash2 = new bytes32[](length);


    for(uint i=0; i<productionHashes.length; i++){
        ProductionHash memory currentProductionHash;
        currentProductionHash = productionHashes[i];
        hash1[i] = currentProductionHash.hashPart1;
        hash2[i] = currentProductionHash.hashPart2;
    }

    return (hash1, hash2);
}


function insertDistributionHash(bytes32 _hashPart1, bytes32 _hashPart2) public{
    DistributionHash memory newDistributionHash;

    newDistributionHash.hashPart1 = _hashPart1;
    newDistributionHash.hashPart2 = _hashPart2;

    distributionHashes.push(newDistributionHash);
}

function getDistributionHashes() public view returns (bytes32[] memory, bytes32[] memory){
    uint length = distributionHashes.length;

    bytes32[] memory hash1 = new bytes32[](length);
    bytes32[] memory hash2 = new bytes32[](length);


    for(uint i=0; i<distributionHashes.length; i++){
        DistributionHash memory currentDistributionHash;
        currentDistributionHash = distributionHashes[i];
        hash1[i] = currentDistributionHash.hashPart1;
        hash2[i] = currentDistributionHash.hashPart2;
    }

    return (hash1, hash2);
}

function insertShopHash(bytes32 _hashPart1, bytes32 _hashPart2) public{
    ShopHash memory newShopHash;

    newShopHash.hashPart1 = _hashPart1;
    newShopHash.hashPart2 = _hashPart2;

    shopHashes.push(newShopHash);
}

function getShopHashes() public view returns (bytes32[] memory, bytes32[] memory){
    uint length = shopHashes.length;

    bytes32[] memory hash1 = new bytes32[](length);
    bytes32[] memory hash2 = new bytes32[](length);


    for(uint i=0; i<shopHashes.length; i++){
        ShopHash memory currentShopHash;
        currentShopHash = shopHashes[i];
        hash1[i] = currentShopHash.hashPart1;
        hash2[i] = currentShopHash.hashPart2;
    }

    return (hash1, hash2);
}
