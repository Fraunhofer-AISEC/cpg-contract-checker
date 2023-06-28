function buyLicense(OrderTypes.LicenseOrder calldata order, string memory uri) public payable {
        require(isOrderExecuted[order.nonce] == false, "Order is already Executed");
        require(isCancelled[order.signer][order.nonce] == false, "Listing is Cancelled");
        bytes32 orderHash = SignatureVerifier.hashMakerOrder(order, ORDER_TYPE_HASH);
        validateMakerOrder(order, orderHash);
        uint256 licenseTokenId = mintLicenseToken(msg.sender, uri, order);

        isOrderExecuted[order.nonce] = true;

        emit LicenseBought(
            licenseTokenId,
            order.price,
            order.category,
            order.tokenId,
            order.signer,
            order.licenseType,
            order.nftContract
        );
    }
