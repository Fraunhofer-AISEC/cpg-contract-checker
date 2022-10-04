modifier onlyStakeholderOrOwnerOfContract(address _address) {
    (bool stakeholderFlag, uint256 i) = isStakeHolder(_address);
    require(stakeholderFlag == true || msg.sender == owner, "the address is not a stakeholder");
    _;
}
