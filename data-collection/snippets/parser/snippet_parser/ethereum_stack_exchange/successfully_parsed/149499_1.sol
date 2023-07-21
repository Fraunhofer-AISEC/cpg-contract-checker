function fulfillRandomWords(uint256 _requestId, uint256[] memory _randomWords) internal override {

    Request memory request = s_requestIdToRequest[_requestId];
    address requestOwner = request.requestOwner;
    address[] memory variants = request.variants;
    uint256 variantsType = request.variantsType;
    uint32 amount = uint32(request.amount);
    address paymentToken = request.paymentToken;
    uint256[] memory allTokenIds = new uint256[](amount);
    address[] memory allVariants = new address[](amount);

    
    if(variantsType == 1) {
        if(variants.length == 1) {
            
            for (uint256 i = 0; i < amount; i++) {
                allVariants[i] = variants[0];
                GMG_ERC721_BaseInterface variant = GMG_ERC721_BaseInterface(variants[0]);
                require(getVariantRemainingSupply(address(variant)) >= 1);
                uint256 mintedId = variant.mintRandomType(requestOwner, _randomWords[i], true, paymentToken);
                allTokenIds[i] = mintedId;
            }
        } else {
            
            for (uint256 i = 0; i < amount; i++) {
                address randomVariant = pickRandomVariant(variants, _randomWords[i]);
                require(randomVariant != address(0), "Not enough NFTs left to fulfill request");
                allVariants[i] = randomVariant;
                GMG_ERC721_BaseInterface variant = GMG_ERC721_BaseInterface(randomVariant);
                require(getVariantRemainingSupply(address(variant)) >= 1);
                uint256 mintedId = variant.mintRandomType(requestOwner, _randomWords[i], true, paymentToken);
                allTokenIds[i] = mintedId;
            }
        }
    }

    
    if(variantsType == 2) {
        if(variants.length == 1) {
            
            for (uint256 i = 0; i < amount; i++) {
                allVariants[i] = variants[0];
                GMG_ERC1155_BaseInterface variant = GMG_ERC1155_BaseInterface(variants[0]);
                require(getVariantRemainingSupply(address(variant)) >= 1);
                uint256 mintedId = variant.mintRandomType(requestOwner, _randomWords[i], true, paymentToken);
                allTokenIds[i] = mintedId;
            }
        } else {
            
            for (uint256 i = 0; i < amount; i++) {
                address randomVariant = pickRandomVariant(variants, _randomWords[i]);
                require(randomVariant != address(0), "Not enough NFTs left to fulfill request");
                allVariants[i] = randomVariant;
                GMG_ERC1155_BaseInterface variant = GMG_ERC1155_BaseInterface(randomVariant);
                require(getVariantRemainingSupply(address(variant)) >= 1);
                uint256 mintedId = variant.mintRandomType(requestOwner, _randomWords[i], true, paymentToken);
                allTokenIds[i] = mintedId;
            }
        }
    }

    emit NFTMintedAll(_requestId, requestOwner, _randomWords, amount, allVariants, allTokenIds);

}
