contract FactoryTest { 
    address[2] newContracts;

    function createContract(string name) public {
        address newContract = new ContractTest(name);
        newContracts[0] = newContract;
    }

    function getContract() public view returns (address) {
      return newContracts[0];
    }
}
