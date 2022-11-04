string public constant AUTHORIZER_SIGNATURE = "Authorizer(string websiteDomain,uint256 currentBlock,bytes32 uniqueToken)";
bytes32 private constant _AUTHORIZER_SIGNATURE_TYPEHASH = keccak256(abi.encodePacked(keccak256(bytes(AUTHORIZER_SIGNATURE))));

function _getDigest(string memory websiteDomain, uint256 signCurrentBlock, bytes32 uniqueToken) private view returns (bytes32) {
    return _hashTypedDataV4(
        _getStructHashFromPayloadMsg(websiteDomain, signCurrentBlock, uniqueToken)
    );
}

function _getStructHashFromPayloadMsg(string memory websiteDomain, uint256 signCurrentBlock, bytes32 uniqueToken) private pure returns (bytes32) {
    return keccak256(
        abi.encode(
            _AUTHORIZER_SIGNATURE_TYPEHASH, 
            keccak256(bytes(websiteDomain)),
            signCurrentBlock,
            uniqueToken
        )
    );
}

function DEBUG_recover(string memory websiteDomain, uint256 signCurrentBlock, bytes32 uniqueToken, bytes memory signature) external view returns (address) {
    return ECDSA.recover(_getDigest(websiteDomain, signCurrentBlock, uniqueToken), signature);
}
