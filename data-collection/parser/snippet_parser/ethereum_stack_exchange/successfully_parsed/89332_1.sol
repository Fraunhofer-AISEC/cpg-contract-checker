    function uri(uint256 _id) external virtual view override(ERC1155) returns (string memory) {
        return Strings.strConcat(
            ERC1155.uri(),
            Address.toAsciiString(address(this)),
            "/",
            Strings.uint2str(_id),
            ".json"
        );
    }
