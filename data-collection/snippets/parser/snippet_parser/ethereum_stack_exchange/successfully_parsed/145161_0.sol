function reddish(uint256 _red) public view returns (bytes memory) {
    bytes memory err = abi.encode(msg.sender, _red);
    assembly {
        return(add(err, 32), mload(err))
    }
}
