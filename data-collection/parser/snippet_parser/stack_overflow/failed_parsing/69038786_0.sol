contract IntelPropertyDataHolder {
    mapping(uint => address) public contractAddr;
    ...
    function setContract(uint _contractType, address _newAddress) public onlyAdmin isContract(_newAddress) {
        require(_contractType >=0  && _contractType <= 5, "Contract out of bounds");
        address prevContractAddr = contractAddr[_contractType];
        contractAddr[_contractType] = _newAddress;
        emit SetContract(_contractType, prevContractAddr, contractAddr[_contractType]);
    }
