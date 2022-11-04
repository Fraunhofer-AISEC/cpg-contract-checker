contract ContractTwo {

    function deposit() public payable {}

    function depositOnContractOne(address _contractOne) public { 
        ContractOne one = new ContractOne(_contractOne);
        one.deposit{value: 10, gas: 100000}(); 
    }
}
