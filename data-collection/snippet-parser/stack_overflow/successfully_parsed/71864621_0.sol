function getAllDetails(address _addressCandidat)
        public
        view
        returns (CV memory)
    {
        return CVs[_addressCandidat];
}