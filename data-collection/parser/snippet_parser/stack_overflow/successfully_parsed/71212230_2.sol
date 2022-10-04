function getUserBalance(address _owner) external view returns (uint) {
    return address(_owner).balance;
}
