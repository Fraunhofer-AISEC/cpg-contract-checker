contract AbiInterface {
    function get(address _address) public returns (uint256[]);
}

function doIt() {
    AbiInterface myContract = AbiInterface.at(DeployedContractAddress);
    myContract.get(0xfffff);
}
