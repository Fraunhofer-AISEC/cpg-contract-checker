struct HachiTicket {
        address to;
        uint256[]  amounts;
        bytes32[]  merkleProof;
        bytes  signature;
    }

function mint(Ticket calldata _ticket) public whenNotPaused nonReentrant payable  {
        address _signer = verifySigner(_ticket);
        require(msg.sender == _signer, "Verification Failed");
        uint _length = _ticket.amounts.length;
        uint[] memory _tokenId = _ticket.amounts;

        require(tokenIndex + _length <= mintLimit, "Sold Out");
        if(!publicMint) {
            require(whtlst.verifyWhitelist(_ticket.merkleProof, _signer), "Not Whitelisted");
        }
        require(numberMinted[_signer] + _length <= addressMintLimit, "Address mint limit reached");
        require(msg.value >= mintPrice*_length, "Insufficient funds");
        for(uint i=0; i<_length; i++){
            require(_ticket.amounts[i] == 1, "Invalid amounts array");
            tokenIndex ++;
            _tokenId[i] = tokenIndex;
        }

function verifySigner(Ticket calldata _ticket) internal view returns (address) {
        bytes32 digest = _hash(_ticket);
        return ECDSA.recover(digest, _ticket.signature);
    }

    function _hash(Ticket calldata _ticket) internal view returns (bytes32) {
        return _hashTypedDataV4(keccak256(abi.encode(
            keccak256("Ticket(address to,uint256[] amounts,bytes32[] merkleProof)"),
            _ticket.to,
            keccak256(abi.encodePacked(_ticket.amounts)),
            keccak256(abi.encodePacked(_ticket.merkleProof))
        )));
    }
