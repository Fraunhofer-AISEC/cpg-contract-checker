function redeem(address _redeemer, NFTVoucher calldata _voucher) public payable returns (uint256) {
        require(startingAt < block.timestamp, "Not started");
        require(totalSupply[_voucher.tokenId] < _voucher.maxSupply, "Limit reached");

        address signer = _verify(_voucher);

        require(hasRole(MINTER_ROLE, signer), "Signature invalid or unauthorized");

        require(msg.value >= _voucher.minPrice, "Insufficient funds to redeem");

        idToUri[_voucher.tokenId] = _createUri(_voucher.uri);

        _mint(signer, _voucher.tokenId, 0, "");

        _mint(_redeemer, _voucher.tokenId, 1, "");

        return _voucher.tokenId;
    }
