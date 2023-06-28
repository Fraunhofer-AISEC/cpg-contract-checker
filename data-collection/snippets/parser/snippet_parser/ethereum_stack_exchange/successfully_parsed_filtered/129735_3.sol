    function concatB() external pure returns (string memory) {
        bytes memory extractedStr = '0xFFFF00';
        return string(abi.encodePacked('<path d="', string(extractedStr) ,'" fill="#FFFFFF"/>'));
    }
