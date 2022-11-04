contract MyToken {

    mapping (address => uint256) public balanceOf;
    string name;
    string symbol;
    uint8 decimals; 
    string fallback;

    function MyToken(uint256 initialSupply, string tokenName, string tokenSymbol) payable {
        balanceOf[msg.sender] = initialSupply;             
        name = tokenName;
        symbol = tokenSymbol;
        decimals = 18;
        fallback = "Fallback not called!";
    }

    function feedBack() {
        fallback = "Fallback function correctly called!";
    }

    function getFeedback() constant returns(string) {
        return fallback;
    }

    function() payable {
        feedBack();
    }
}
