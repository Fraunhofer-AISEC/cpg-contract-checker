function issueCustomURL() public view returns (string memory){ 
    return string(
        abi.encodePacked(
            customURL,
            "?",
            Base64.encode( abi.encodePacked( Strings.toHexString(address(this)) )
            )
        ));
}
