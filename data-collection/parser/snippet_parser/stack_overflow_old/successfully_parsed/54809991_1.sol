contract Factory{
    CrowdFunding[] public deployedContractAddresses;

    constructor(uint minimum) public {
        CrowdFunding newContract = new CrowdFunding(minimum, msg.sender);
        deployedContractAddresses.push(newContract);
    }

    function getDeployedContractAddresses() public view returns(CrowdFunding[] memory) {
        return deployedContractAddresses;
    }
}
