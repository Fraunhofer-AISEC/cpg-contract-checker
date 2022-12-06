contract SimpleToken is ERC20, ERC20Detailed, ERC20Burnable {
    DateTime dateTime;
    ...


    function insertItemYYYYMM(uint256 _value, uint16 year, uint8 month) onlyOwne public returns (bool){
        uint256 time = dateTime.toTimestamp(year, month, 1);
        ...
