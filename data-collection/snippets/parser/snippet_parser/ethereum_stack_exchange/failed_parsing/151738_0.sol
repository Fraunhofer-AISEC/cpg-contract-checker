contract TestContract is UUPSUpgradeable {
    AnotherContract public contractInstance;

    function initialize(address contractAddress) public initializer {
        contractInstance = AnotherContract(contractAddress);
    }

    function testFunction() public {
        contractInstance.anotherFunction(....)
    }
}
