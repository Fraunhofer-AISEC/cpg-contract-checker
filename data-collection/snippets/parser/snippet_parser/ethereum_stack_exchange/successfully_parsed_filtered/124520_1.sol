function setStatus(uint256 _status) external onlyOwner {
    require(_status <= uint256(Status.PENDING), "Status out of bounds");
    myStatus = Status(_status);
}
