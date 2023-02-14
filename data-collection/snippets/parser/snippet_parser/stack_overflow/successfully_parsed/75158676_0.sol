contract Chainlink is usingOraclize {
    string public EURUSD;
    function updatePrice() public payable {
        if (oraclizegetPrice("URL") > this.balance) { 
            
        } else {
            oraclizequery("URL", "json(http://api.fixer.io/latest?symbols=USD).rates.USD");
        }
    }
    function _callback(bytes32 myid, string result) public {
        require(msg.sender == oraclizecbAddress());
        EURUSD = result;
    }
}
