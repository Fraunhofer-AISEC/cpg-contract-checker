contract Store {

    function set(address contractAddress, string memory value) public {
        (bool success, bytes memory data) = address(contractAddress).call(abi.encodeWithSignature("set(string)", value));
        require(success, "Failed");
    }
}
