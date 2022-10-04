contract ContractFactory {
    ThreeJudge[] public deployedContracts;

    function createContract(address payable _buyer, address payable _seller) public {
        ThreeJudge newContract = new ThreeJudge(_buyer, _seller);
        deployedContracts.push(newContract);
    }

    function getDeployedContracts() public view returns (ThreeJudge[] memory) {
        return deployedContracts;
    }
}

contract ThreeJudge {
...
