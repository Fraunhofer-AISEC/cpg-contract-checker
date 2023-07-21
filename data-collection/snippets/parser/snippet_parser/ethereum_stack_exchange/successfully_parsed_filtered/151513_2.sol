function recoverSignature(
        LoanLibrary.LoanTerms calldata loanTerms,
        Signature calldata sig,
        uint160 nonce,
        Side side,
        bytes32 itemsHash
    ) public view override returns (bytes32 sighash, address signer) {
        bytes32 loanHash = keccak256(
            abi.encode(
                _ITEMS_TYPEHASH,
                loanTerms.durationSecs,
                loanTerms.deadline,
                loanTerms.proratedInterestRate,
                loanTerms.principal,
                loanTerms.collateralAddress,
                itemsHash,
                loanTerms.payableCurrency,
                loanTerms.affiliateCode,
                nonce,
                uint8(side)
            )
        );

        sighash = _hashTypedDataV4(loanHash);
        signer = ECDSA.recover(sighash, sig.v, sig.r, sig.s);
    }
