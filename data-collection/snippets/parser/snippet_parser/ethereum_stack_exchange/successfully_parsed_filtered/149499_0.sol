function requestNFTs(
    address[] memory _variants,
    uint256 _variantsType,
    uint32 _amount,
    address _paymentToken
) external {

    require(_amount > 0, "Amount must be greater than zero");
    require(_variantsType == 1 || _variantsType == 2, "Invalid type: ERC721 = 1 | ERC1155 = 2");
    require(getVariantsTotalRemainingSupply(_variants) >= _amount, "Not enough NFTs left to fulfill request");

    uint256 requestId = COORDINATOR.requestRandomWords(
        keyHash,
        s_subscriptionId,
        requestConfirmations,
        callbackGasLimit,
        _amount
    );

    s_requestIdToRequest[requestId] = Request({
        requestOwner: msg.sender,
        variants: _variants,
        variantsType: _variantsType,
        amount: _amount,
        paymentToken: _paymentToken
    });

    emit NFTRequest(requestId, msg.sender, _variants, _amount);

}
