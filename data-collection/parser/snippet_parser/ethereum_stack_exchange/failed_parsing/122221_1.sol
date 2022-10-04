...
    address private _signerAddress = 0x123..;

    function _validSignature(bytes memory signature, bytes32 msgHash) internal view returns (bool) {
        return msgHash.toEthSignedMessageHash().recover(signature) == _signerAddress;
    }

    function reedem(
        address _to,
        uint256 _amount,
        uint256 _nonce,
        string memory _symbol,
        bytes memory signature
    ) external {
        bytes32 msgHash = keccak256(
            abi.encode(_to, _amount, _nonce, _symbol)
        );
        require(_validSignature(signature, msgHash), "INVALID_SIGNATURE");
        
        
        
        token.mint(_to, _amount);
    }
