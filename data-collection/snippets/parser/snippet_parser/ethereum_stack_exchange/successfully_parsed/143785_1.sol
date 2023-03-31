    function tokenURI(uint256 _tokenId) public view override returns (string memory) {
        require(obsolescence[uint32(_tokenId)].MintingDate != 0, "Token doesn't exist !");

        if (block.timestamp - obsolescence[uint32(_tokenId)].MintingDate >= diams_time){

            if (obsolescence[uint32(_tokenId)].nbOwners <= 1) {
                return "ipfs://[...]";
            } else if (obsolescence[uint32(_tokenId)].nbOwners > 1 && obsolescence[uint32(_tokenId)].nbOwners <= 2) {
                return "ipfs://[...]";
            } else if (obsolescence[uint32(_tokenId)].nbOwners > 2 && obsolescence[uint32(_tokenId)].nbOwners <= 3) {
                return "ipfs://[...]";
            } else {
                return "ipfs://[...]";
            }
        } else {

            return "ipfs://[...]";
        }
    }
