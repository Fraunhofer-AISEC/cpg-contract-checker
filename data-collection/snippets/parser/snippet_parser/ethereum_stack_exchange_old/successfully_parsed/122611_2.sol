function Name(bytes memory data) public pure returns(uint8 number1, uint256 number2) {
    
        (number1, number2) = abi.decode(data, (uint8, uint256));

    }
