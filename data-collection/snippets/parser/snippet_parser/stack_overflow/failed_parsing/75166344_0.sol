contract Account {
  struct User {
    string username;
  }

  function createAccount(
    address _signer,
    User _user,
    uint256 _nonce,
    bytes memory _signature
  ) {
    bytes32 messageHash = keccak256(abi.encode(_user, _nonce));
    bytes32 signedHash = keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", _messageHash));
    require(recoverSigner(signedHash, _signature) == _signer);
    ...

  }

    function recoverSigner(
        bytes32 _ethSignedMessageHash,
        bytes memory _signature
    ) public pure returns (address) {
        (bytes32 r, bytes32 s, uint8 v) = splitSignature(_signature);

        return ecrecover(_ethSignedMessageHash, v, r, s);
    }

    function splitSignature(bytes memory sig)
        public
        pure
        returns (
            bytes32 r,
            bytes32 s,
            uint8 v
        )
    {
        require(sig.length == 65, "invalid signature length");

        assembly {
            

            
            r := mload(add(sig, 32))
            
            s := mload(add(sig, 64))
            
            v := byte(0, mload(add(sig, 96)))
        }

        
    }
}

