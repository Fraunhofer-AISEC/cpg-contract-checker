    mapping (uint256 => bool) collectionIdIsUsed;

    function readCollectionIdIsUsed(uint256 collectionId) external view returns (bool res) {
        require(collectionIdIsUsed[collectionId], 'This signature has not been used');
        res = collectionIdIsUsed[collectionId];
    }

