modifier onlyStakeholderOrOwnerOfContract(address _address) {
    (bool stakeholderFlag, ) = isStakeHolder(_address);
    require(stakeholderFlag == true || msg.sender == owner, "the address is not a stakeholder");
    _;
}
