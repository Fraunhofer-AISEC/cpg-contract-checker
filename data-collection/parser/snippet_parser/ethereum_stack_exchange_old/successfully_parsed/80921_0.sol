    function checkLock() external view returns (bool) {
        require(
            address(this) == IERC721(_nftRegistryAddress).ownerOf(_tokenId),
            "[checkLock] Contract is not owner of tokenId"
        );
        return true;
    }
