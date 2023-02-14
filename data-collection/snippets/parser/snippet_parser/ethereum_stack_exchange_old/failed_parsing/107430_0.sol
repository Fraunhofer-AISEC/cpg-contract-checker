function boo(string memory _string) public view returns (string memory result) {
        assembly {
            result := mload(add(_string, 64))
        }
    }
}
