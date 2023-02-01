function getData() public returns (bytes32, bytes32, bytes32, bytes32) {
    require(approvedAccessors[msg.sender] == true);

    return (a, b, c, d);
}
