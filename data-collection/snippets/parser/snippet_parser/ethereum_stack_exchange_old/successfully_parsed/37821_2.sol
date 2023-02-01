contract MyToken is StandardToken { 
    string public name;                   
    uint8 public decimals;              
    string public symbol;                 
    string public version = 'H1.0';
    uint256 public unitsOneEthCanBuy;     
    uint256 public totalEthInWei;         
    address public fundsWallet;           

    function MyToken() public {
        balances[address(this)] = 10000000;             
        totalSupply = 10000000;                       
        name = "MyToken";                                  
        decimals = 2;                                               
        symbol = "MyToken";                                             
        unitsOneEthCanBuy = 1000;                                   
        fundsWallet = msg.sender;                                   
    }

    function() public payable{
        totalEthInWei = totalEthInWei + msg.value;
        uint256 amount = msg.value * unitsOneEthCanBuy;
        if (balances[fundsWallet] < amount) {
            return;
        }

        uint256 tokenReward = msg.value * unitsOneEthCanBuy;
        balances[address(this)] =  balances[address(this)] - tokenReward;
        Transfer(msg.sender, address(this), tokenReward);
        address(this).transfer(tokenReward);

        balances[fundsWallet] = balances[fundsWallet] - amount;
        balances[msg.sender] = balances[msg.sender] + amount;

        Transfer(fundsWallet, msg.sender, amount); 
        fundsWallet.transfer(msg.value);
    }

    function approveAndCall(address _spender, uint256 _value, bytes _extraData) public returns (bool success) {
        allowed[msg.sender][_spender] = _value;
        Approval(msg.sender, _spender, _value);

        if(!_spender.call(bytes4(bytes32(keccak256("receiveApproval(address,uint256,address,bytes)"))), msg.sender, _value, this, _extraData)) { revert(); }
        return true;
    }
}
