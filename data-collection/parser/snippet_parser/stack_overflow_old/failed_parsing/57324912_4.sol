contract ContractFactory {
    address[] public deployedContracts;

    function createContract(address payable _buyer, address payable _seller) public {
        ThreeJudge newContract = new ThreeJudge(_buyer, _seller);
        deployedContracts.push(address(newContract));
    }

    function getCampaignsByAddress() public view returns (address[] memory) {
        return deployedContracts;
    }
}

contract ThreeJudge {
...
