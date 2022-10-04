function mint(
        address account,
        uint256 id,
        uint256 amount,
        uint256 maximum,
        string memory tokenUri,
        bytes memory data
    ) external returns (uint256) {
        require(maximum > 0, "supply incorrect");
        require(amount > 0, "amount incorrect");

        if (supply[id] == 0) {
            _saveSupply(id, maximum);
            _saveCreator(id, _msgSender());
        }

        uint256 newMinted = amount.add(minted[id]);
        require(newMinted <= supply[id], "more than supply");
        minted[id] = newMinted;

        require(creators[id] == _msgSender(), "different creator");

        _setTokenURI(id, tokenUri);
        _mint(account, id, amount, data);
    }

    function _setTokenURI(uint256 tokenId, string memory tokenUri) internal virtual {
        tokenURIs[tokenId] = tokenUri;
        emit URI(tokenUri, tokenId);
    }

    function _mint(address account, uint256 id, uint256 amount, bytes memory data) internal virtual {
        require(account != address(0), "ERC1155: mint to the zero address");

        address operator = _msgSender();

        _beforeTokenTransfer(operator, address(0), account, _asSingletonArray(id), _asSingletonArray(amount), data);

        _balances[id][account] = _balances[id][account].add(amount);
        emit TransferSingle(operator, address(0), account, id, amount);

        _doSafeTransferAcceptanceCheck(operator, address(0), account, id, amount, data);
    }

