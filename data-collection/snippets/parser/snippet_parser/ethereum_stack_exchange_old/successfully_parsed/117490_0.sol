function encode(string memory _address1, string memory _address2) public  returns (bytes memory) {
        encoded = abi.encodePacked(_address1, _address2);
        return encoded;

    }
