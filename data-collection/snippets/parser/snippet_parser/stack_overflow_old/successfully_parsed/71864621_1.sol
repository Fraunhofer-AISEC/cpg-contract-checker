function getAllCandidaturesOfJobOffer(uint256 _idJobOffer)
        public
        view
        returns (address[] memory)
    {
        return idJobAddressCandidat[_idJobOffer];
    }
