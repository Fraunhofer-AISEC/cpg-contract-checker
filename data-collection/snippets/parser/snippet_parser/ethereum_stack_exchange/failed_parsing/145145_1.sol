function getTransactionHash(
        address _to,
        uint256 _value,
        bytes32 _key,
        uint256 nonce
    ) internal pure returns (bytes32) {
        bytes32 transactionHash = keccak256(
            abi.encodePacked(_to, _value, _key, nonce)
        );

        return transactionHash;
    }

    function getEthSignedTransactionHash(
        bytes32 _hash
    ) internal pure returns (bytes32) {
        return
            keccak256(
                abi.encodePacked("\x19Ethereum Signed Message:\n32", _hash)
            );
    }
}
