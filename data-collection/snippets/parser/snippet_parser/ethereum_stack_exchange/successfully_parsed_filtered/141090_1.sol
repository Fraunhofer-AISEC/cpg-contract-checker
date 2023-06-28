function strConcat(string calldata firstString, string calldata secondString) external pure returns (string memory) {
        return string(abi.encodePacked(firstString, secondString));
    }
