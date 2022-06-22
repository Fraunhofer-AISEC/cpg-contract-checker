uint256 tokenId = totalSupply();

        
        uint256 rand = getRandom(tokenId);

        
        TransactionData memory transaction = TransactionData(
            _minter,
            block.timestamp,
            _amount
        );
        transactions.push(transaction);
        transactionsForAddress[_minter].push(transaction);

        uint256 typeId = getRandomType(rand);
        uint256 level = gen1
            ? typeId == 0 ? _regular : _rare
            : 1;

        
        nfts.push(NFT(tokenId, typeId, level));

        _safeMint(_minter, tokenId);

        emit TokenMinted(_minter, tokenId);
    }
