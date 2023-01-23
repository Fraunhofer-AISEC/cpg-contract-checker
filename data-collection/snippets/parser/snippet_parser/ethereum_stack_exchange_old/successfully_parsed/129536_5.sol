function overwriteAmount(uint256 amount, bytes memory data) public pure returns(bytes memory) {

        require(data.length == 68, "Expected 68 bytes of data");

        assembly {
            
            
            mstore(add(add(data, 32), 36), amount)
        }
        return data;
    }
