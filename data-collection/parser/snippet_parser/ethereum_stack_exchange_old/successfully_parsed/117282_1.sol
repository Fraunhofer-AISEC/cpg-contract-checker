constructor(uint256 _value) {
    owner = payable(msg.sender);
    value = _value;
}

function getTotalDonations() public view returns (uint256) {
    return totalDonations;
}

function donate() public payable {
    (bool success, ) = owner.call{value: value}("");
    require(success, "Failed to send money");
}
