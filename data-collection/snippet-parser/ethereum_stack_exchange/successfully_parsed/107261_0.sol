 function createIdea(
        string calldata area,
        string calldata path,
        string calldata ideaType,
        string calldata ideaValue,
        string calldata amountValue,
        string calldata ideaVerifiedThrough,
        address user,
        string calldata firstIdeaID,
        string calldata secondIdeaID,
        string calldata comment,
        string calldata ideaFromWebsite,
        string calldata prevContent,
        bytes calldata signature
    ) external {
        
        bytes32 messageHash = toEthSignedMessageHash(
            keccak256(
                abi.encodePacked(
                    area,
                    path,
                    ideaType,
                    ideavalue,
                    amountValue,
                    ideaVerifiedThrough,
                    user,
                    firstIdeaID,
                    secondIdeaID,
                    comment,
                    ideaFromWebsite,
                    prevContent
                )
            )
        );
        require(
            recoverSigner(messageHash, signature) == user,
            "Signature error."
        );
        _internalCreateIdea(
              area,
                    path,
                    ideaType,
                    ideavalue,
                    amountValue,
                    ideaVerifiedThrough,
                    user,
                    firstIdeaID,
                    secondIdeaID,
                    comment,
                    ideaFromWebsite,
                    prevContent
        );
    }
