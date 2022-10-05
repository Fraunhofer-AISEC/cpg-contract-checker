
function extractSigner(
        uint8 v,
        bytes32 r,
        bytes32 s
    ) internal view returns (address) {
        string memory n = toString(nonce); 
        bytes32 hash = keccak256(
            abi.encodePacked(
                "\x19Ethereum Signed Message:\n32",
                keccak256(bytes(n))
            )
        );
        return ecrecover(hash, v, r, s);
    }
