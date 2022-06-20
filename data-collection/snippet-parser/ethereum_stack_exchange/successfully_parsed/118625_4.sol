function get(string calldata variableName) public view returns (uint256) {
    (bool success, bytes memory data) = address(this).staticcall(
        abi.encodeWithSelector(
            bytes4(
                keccak256(abi.encodePacked(variableName,"()"))
            )
        )
    );
    
    if (success) {
        return abi.decode(data, (uint256));
    }
}
