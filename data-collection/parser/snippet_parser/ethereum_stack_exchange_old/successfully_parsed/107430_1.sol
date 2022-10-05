function parseDate(string memory date) public pure returns (bytes32, bytes32, bytes32) {
    
    bytes32 year;
    bytes32 month;
    bytes32 day;
    assembly {
        let x := mload(add(date, 32))
        year  := shl(224, shr(224, x))     
        x     := mload(add(date, 37))      
        month := shl(240, shr(240, x))     
        x     := mload(add(date, 40))      
        day   := shl(240, shr(240, x))
    }
    return (year, month, day);
}
