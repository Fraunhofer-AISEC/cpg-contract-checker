pragma solidity >=0.7.4;

import "./Crowdfunding.sol";

contract Factory {
    address[] public deployedCrowdfundings;

    event ContractDeployed(
        address crowdfundingAddress,
        address deployerAddress
    );

    function createCrowdfunding(uint256 minimumContribution) public {
        address newCrowdfunding =
            address(new Crowdfunding(minimumContribution, msg.sender));
        deployedCrowdfundings.push(newCrowdfunding);
        emit ContractDeployed(newCrowdfunding, msg.sender);
    }

    function getDeployedCrowdfundings() public view returns (address[] memory) {
        return deployedCrowdfundings;
    }
}
