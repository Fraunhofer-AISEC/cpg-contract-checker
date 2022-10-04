function publicSaleBuy(bytes calldata signature, string memory message) external payable
    {
        if (!matchAddresSigner(hashTransaction(message), signature)){
            revert DirectMintFromNotAllowed();
        }else {
            _mint(1);
        }

    }

    function matchAddresSigner(bytes32 hash, bytes memory signature)
        private
        view
        returns (bool)
    {
        return signerAddress == hash.recover(signature);
    }

    function hashTransaction(string memory message) public pure returns (bytes32) {
        bytes32 messageHash = keccak256(abi.encodePacked(message));
        bytes32 hash = keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", messageHash));        
        return hash;
    }
