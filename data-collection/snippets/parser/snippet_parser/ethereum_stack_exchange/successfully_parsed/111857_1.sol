function mint(address _to, uint _amount) external {
    require(msg.sender == address(collectionManager));
    _safeMint(_to, _amount);
}
