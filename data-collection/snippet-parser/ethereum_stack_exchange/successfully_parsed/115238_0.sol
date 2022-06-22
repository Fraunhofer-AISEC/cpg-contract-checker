function onERC721Received(
         address,
        address from,
        uint256 tokenId,
        bytes calldata
    )
        external
        override
        returns(bytes4)
    {
        uint256 loanId = uint256(keccak256(abi.encode(address(msg.sender), tokenId)));
        loans[loanId] = Loan({
            _tokenContract: ERC721(msg.sender),
            tokenId: tokenId,
            borrower: from,
            loanValue: 0,
            loanDuration: calldata,
            repayable: false
        });
        lend(from, msg.sender, tokenId);
        return 0x150b7a02;
    }
