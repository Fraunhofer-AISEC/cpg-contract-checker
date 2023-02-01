clonedAddresses[] public contractAddresses;

function getContracts() external view returns (clonedAddresses[] memory) {
    return contractAddresses;
}
