library Library{
    struct NFTInfo{
        uint256 collectId;
        uint256 totalSupply;
    }


    function viewInfo( mapping(string => NFTInfo) storage self, string calldata _uri)
        internal
        returns (NFTInfo storage)
    {
        return self[_uri];
    }
}
