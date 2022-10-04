function addNewContract(string _aa string _bb, string _cc, address _aa, bool _created, address _bb, address _cc) external onlyOwner returns(address newContract) {
        Contract c = new Contract(_aa, _bb, _cc, _aa, _registeredBusiness, _bb, _cc);
        associatedContracts.push(address(c));
        return address(c);
    }
