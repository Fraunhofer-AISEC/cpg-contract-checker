library MappingLib {
    struct Balance {
        uint256 value;
        mapping(string => uint256) positions;
    }
    
    function checkBalance(Balance storage balance, string memory key) public returns (uint256) {
        return balance.positions[key];
    }
}
