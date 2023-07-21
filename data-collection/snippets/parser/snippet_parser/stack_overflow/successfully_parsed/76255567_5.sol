contract ContractB {
    address contractAddress = 0xD7ACd2a9FD159E69Bb102A1ca21C9a3e3A5F771B;

    function getPerson(uint256 _index)
        public
        view
        returns (IContractA.Person memory)
    {
        IContractA contractAIns = IContractA(contractAddress);
        return contractAIns.person(_index);
    }
}
