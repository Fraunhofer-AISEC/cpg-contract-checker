    function concatA() external pure returns (string memory) {
        bytes memory extractedStr = '0xFFFF00';
        return string.concat('<path d="', string(extractedStr) ,'" fill="#FFFFFF"/>');
    }
