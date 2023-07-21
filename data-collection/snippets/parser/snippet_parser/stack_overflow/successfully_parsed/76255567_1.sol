interface IContractA {
    struct Person {
        string name;
    }

    function persons(uint256 _index) external view returns (Person memory);
}

contract ContractB {
    address contractAddress = 0x3328358128832A260C76A4141e19E2A943CD4B6D;

    function getPerson(uint256 _index)
        public
        view
        returns (IContractA.Person memory)
    {
        IContractA contractAIns = IContractA(contractAddress);
        return contractAIns.persons(_index);
    }
}
