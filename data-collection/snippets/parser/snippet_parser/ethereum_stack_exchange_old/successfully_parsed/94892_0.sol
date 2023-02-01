contract Fuzz {

    uint256 totalSupply;
    uint256 totalAvailable;

    mapping (address => uint256) balances;

    function mint(address user, uint256 amount) public {
        balances[user] += amount;

        if (totalSupply == 0) {
            
            totalSupply = amount;
            totalAvailable = amount;
        } else {
            
            uint originalSupply = totalSupply;
            totalSupply += amount;
            totalAvailable += totalAvailable * totalSupply / originalSupply;
        }
    }

    function burn(uint fees) public {
        balances[msg.sender] -= fees;
        totalAvailable -= fees;
    }

    function balanceOf(address user) public view returns (uint256) {
       return balances[user] * totalSupply / totalAvailable;
    }
}
