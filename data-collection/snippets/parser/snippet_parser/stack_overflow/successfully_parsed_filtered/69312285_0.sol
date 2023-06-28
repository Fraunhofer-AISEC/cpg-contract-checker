    function uint8tohexchar(uint8 i) public pure returns (uint8) {
        return (i > 9) ?
            (i + 87) : 
            (i + 48); 
    }
