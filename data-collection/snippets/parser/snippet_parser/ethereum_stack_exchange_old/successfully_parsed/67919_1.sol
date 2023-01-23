contract Registry is Ownable {
  address core;

  function setCore(address _core) external onlyOwner {
    core = _core;
  }

  function getCore() public view returns (address) {
    return core;
  }
}
